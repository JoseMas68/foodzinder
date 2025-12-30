"use server";

import { auth } from "@clerk/nextjs/server";
import { uploadToBunny } from "@/lib/bunny";

/**
 * Acción de servidor para subir imágenes
 * @param formData FormData que contiene un campo 'file' y opcionalmente 'folder'
 */
export async function uploadImageAction(formData: FormData) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        const file = formData.get("file") as File;
        const folder = (formData.get("folder") as string) || "uploads";

        if (!file) {
            throw new Error("No se proporcionó ningún archivo");
        }

        // Convertir File a Buffer para el helper de Bunny
        const arrayBuffer = await file.arrayBuffer();
        const buffer = Buffer.from(arrayBuffer);

        const imageUrl = await uploadToBunny(buffer, file.name, folder);

        return { success: true, url: imageUrl };
    } catch (error: any) {
        console.error("Error in uploadImageAction:", error);
        return { success: false, error: error.message };
    }
}
