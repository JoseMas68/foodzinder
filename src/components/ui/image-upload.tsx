'use client'

import { X, Upload, Loader2 } from "lucide-react"
import { useState, useCallback } from "react"
import { useDropzone } from "react-dropzone"
import { cn } from "@/lib/utils"
import { Button } from "./button"
import Image from "next/image"

interface ImageUploadProps {
  value?: string
  onChange: (url: string) => void
  onRemove?: () => void
  disabled?: boolean
  className?: string
}

export function ImageUpload({
  value,
  onChange,
  onRemove,
  disabled,
  className,
}: ImageUploadProps) {
  const [isUploading, setIsUploading] = useState(false)

  const compressImage = async (file: File): Promise<File> => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = (event) => {
        const img = new window.Image()
        img.src = event.target?.result as string
        img.onload = () => {
          const canvas = document.createElement('canvas')
          let width = img.width
          let height = img.height

          // Dimensiones optimizadas (suficiente para web)
          const maxWidth = 1920
          const maxHeight = 1920

          if (width > height) {
            if (width > maxWidth) {
              height *= maxWidth / width
              width = maxWidth
            }
          } else {
            if (height > maxHeight) {
              width *= maxHeight / height
              height = maxHeight
            }
          }

          canvas.width = width
          canvas.height = height

          const ctx = canvas.getContext('2d')
          ctx?.drawImage(img, 0, 0, width, height)

          canvas.toBlob(
            (blob) => {
              if (blob) {
                const compressedFile = new File([blob], file.name, {
                  type: 'image/jpeg',
                  lastModified: Date.now(),
                })
                resolve(compressedFile)
              } else {
                reject(new Error('Failed to compress image'))
              }
            },
            'image/jpeg',
            0.85 // Buena calidad con menor tamaño
          )
        }
        img.onerror = () => reject(new Error('Failed to load image'))
      }
      reader.onerror = () => reject(new Error('Failed to read file'))
    })
  }

  const onDrop = useCallback(
    async (acceptedFiles: File[]) => {
      if (acceptedFiles.length > 0) {
        setIsUploading(true)

        try {
          let file = acceptedFiles[0]

          // Comprimir todas las imágenes para optimizar tamaño
          try {
            file = await compressImage(file)
          } catch (compressError) {
            console.warn('Compression failed, using original file:', compressError)
          }

          // Validate file size after compression (max 5MB)
          const maxSize = 5 * 1024 * 1024
          if (file.size > maxSize) {
            alert("La imagen es demasiado grande. El tamaño máximo es 5MB.")
            setIsUploading(false)
            return
          }

          const formData = new FormData()
          formData.append("file", file)

          const response = await fetch("/api/upload", {
            method: "POST",
            body: formData,
          })

          if (!response.ok) {
            const errorData = await response.json().catch(() => ({}))
            throw new Error(errorData.error || "Upload failed")
          }

          const data = await response.json()
          onChange(data.url)
        } catch (error) {
          console.error("Upload error:", error)
          const errorMessage = error instanceof Error ? error.message : "Error desconocido"
          alert(`Error al subir la imagen: ${errorMessage}. Por favor intenta de nuevo.`)
        } finally {
          setIsUploading(false)
        }
      }
    },
    [onChange]
  )

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'image/*': ['.png', '.jpg', '.jpeg', '.webp']
    },
    maxFiles: 1,
    disabled: disabled || isUploading,
  })

  return (
    <div className={cn("space-y-4", className)}>
      {value ? (
        <div className="relative aspect-video w-full max-w-md overflow-hidden rounded-lg border bg-gray-50">
          <Image
            src={value}
            alt="Uploaded image"
            fill
            className="object-cover"
          />
          {onRemove && !disabled && (
            <Button
              type="button"
              variant="destructive"
              size="icon"
              className="absolute right-2 top-2"
              onClick={onRemove}
            >
              <X className="h-4 w-4" />
            </Button>
          )}
        </div>
      ) : (
        <div
          {...getRootProps()}
          className={cn(
            "flex cursor-pointer flex-col items-center justify-center rounded-lg border-2 border-dashed p-8 transition-colors",
            isDragActive && "border-primary bg-primary/5",
            (disabled || isUploading) && "cursor-not-allowed opacity-50",
            !value && !isDragActive && "hover:border-primary/50 hover:bg-gray-50"
          )}
        >
          <input {...getInputProps()} />
          {isUploading ? (
            <Loader2 className="h-8 w-8 animate-spin text-gray-400" />
          ) : (
            <Upload className="h-8 w-8 text-gray-400" />
          )}
          <p className="mt-2 text-sm text-gray-600">
            {isDragActive
              ? "Suelta la imagen aquí..."
              : "Arrastra una imagen o haz clic para seleccionar"}
          </p>
          <p className="text-xs text-gray-400">PNG, JPG, JPEG o WEBP (máx. 5MB)</p>
        </div>
      )}
    </div>
  )
}
