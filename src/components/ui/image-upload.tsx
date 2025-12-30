'use client'

import { useUploadThing } from "@/lib/uploadthing"
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
  endpoint: "restaurantLogo" | "restaurantCover" | "restaurantGallery"
  disabled?: boolean
  className?: string
}

export function ImageUpload({
  value,
  onChange,
  onRemove,
  endpoint,
  disabled,
  className,
}: ImageUploadProps) {
  const [isUploading, setIsUploading] = useState(false)

  const { startUpload, isUploading: isUploadingState } = useUploadThing(endpoint, {
    onClientUploadComplete: (res) => {
      if (res && res[0]) {
        onChange(res[0].url)
        setIsUploading(false)
      }
    },
    onUploadError: (error: Error) => {
      console.error("Upload error:", error)
      setIsUploading(false)
      alert(`Error al subir la imagen: ${error.message}`)
    },
  })

  const onDrop = useCallback(
    async (acceptedFiles: File[]) => {
      if (acceptedFiles.length > 0) {
        setIsUploading(true)
        await startUpload(acceptedFiles)
      }
    },
    [startUpload]
  )

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'image/*': ['.png', '.jpg', '.jpeg', '.webp']
    },
    maxFiles: 1,
    disabled: disabled || isUploading || isUploadingState,
  })

  return (
    <div className={cn("space-y-4", className)}>
      {value ? (
        <div className="relative aspect-video w-full overflow-hidden rounded-lg border bg-gray-50">
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
            (disabled || isUploading || isUploadingState) && "cursor-not-allowed opacity-50",
            !value && !isDragActive && "hover:border-primary/50 hover:bg-gray-50"
          )}
        >
          <input {...getInputProps()} />
          {isUploading || isUploadingState ? (
            <Loader2 className="h-8 w-8 animate-spin text-gray-400" />
          ) : (
            <Upload className="h-8 w-8 text-gray-400" />
          )}
          <p className="mt-2 text-sm text-gray-600">
            {isDragActive
              ? "Suelta la imagen aquí..."
              : "Arrastra una imagen o haz clic para seleccionar"}
          </p>
          <p className="text-xs text-gray-400">PNG, JPG, JPEG o WEBP (máx. 8MB)</p>
        </div>
      )}
    </div>
  )
}
