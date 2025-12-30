import { env } from "@/env";

/**
 * Subir archivo a Bunny.net Storage
 * @param file Buffer o Blob del archivo
 * @param fileName Nombre del archivo con extensión
 * @param folder Carpeta de destino (ej: 'restaurants', 'dishes')
 */
export async function uploadToBunny(
    file: Buffer | Blob,
    fileName: string,
    folder: string = "uploads"
) {
    try {
        const storageZoneName = "foodzinder"; // Ajustar según zona real
        const region = "storage"; // O la región específica (ny, sg, etc)
        const apiKey = env.BUNNY_API_KEY;

        if (!apiKey) {
            throw new Error("BUNNY_API_KEY no configurado");
        }

        const path = `${folder}/${Date.now()}-${fileName}`;
        const url = `https://${region}.bunny.net/${storageZoneName}/${path}`;

        const body = file instanceof Blob ? await file.arrayBuffer() : file;

        const response = await fetch(url, {
            method: "PUT",
            headers: {
                AccessKey: apiKey,
                "Content-Type": "application/octet-stream",
            },
            body: body as any,
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Error en Bunny.net: ${errorText}`);
        }

        // Retorna la URL del CDN
        return `${env.NEXT_PUBLIC_BUNNY_CDN_URL}/${path}`;
    } catch (error) {
        console.error("Error uploading to Bunny.net:", error);
        throw error;
    }
}

/**
 * Eliminar archivo de Bunny.net Storage
 */
export async function deleteFromBunny(fileUrl: string) {
    try {
        const storageZoneName = "foodzinder";
        const region = "storage";
        const apiKey = env.BUNNY_API_KEY;

        if (!apiKey) return;

        // Extraer el path de la URL
        const urlPath = fileUrl.replace(`${env.NEXT_PUBLIC_BUNNY_CDN_URL}/`, "");
        const url = `https://${region}.bunny.net/${storageZoneName}/${urlPath}`;

        await fetch(url, {
            method: "DELETE",
            headers: {
                AccessKey: apiKey,
            },
        });
    } catch (error) {
        console.error("Error deleting from Bunny.net:", error);
    }
}
