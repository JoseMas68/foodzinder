import { createUploadthing, type FileRouter } from "uploadthing/next";
import { auth } from "@clerk/nextjs/server";

const f = createUploadthing();

export const ourFileRouter = {
  // Restaurant logo uploader
  restaurantLogo: f({ image: { maxFileSize: "4MB", maxFileCount: 1 } })
    .middleware(async () => {
      console.log("🔐 Logo upload middleware: Checking auth...");
      const { userId } = await auth();
      if (!userId) {
        console.error("❌ Logo upload: Unauthorized - no userId");
        throw new Error("Unauthorized");
      }
      console.log("✅ Logo upload authorized for user:", userId);
      return { userId };
    })
    .onUploadComplete(async ({ metadata, file }) => {
      console.log("✅✅✅ LOGO UPLOAD COMPLETE CALLBACK FIRED! ✅✅✅");
      console.log("Logo uploaded by user:", metadata.userId);
      console.log("File URL:", file.url);
      console.log("File key:", file.key);
      console.log("File name:", file.name);
      return { url: file.url };
    }),

  // Restaurant cover image uploader
  restaurantCover: f({ image: { maxFileSize: "8MB", maxFileCount: 1 } })
    .middleware(async () => {
      console.log("🔐 Cover upload middleware: Checking auth...");
      const { userId } = await auth();
      if (!userId) {
        console.error("❌ Cover upload: Unauthorized - no userId");
        throw new Error("Unauthorized");
      }
      console.log("✅ Cover upload authorized for user:", userId);
      return { userId };
    })
    .onUploadComplete(async ({ metadata, file }) => {
      console.log("✅✅✅ COVER UPLOAD COMPLETE CALLBACK FIRED! ✅✅✅");
      console.log("Cover uploaded by user:", metadata.userId);
      console.log("File URL:", file.url);
      console.log("File key:", file.key);
      console.log("File name:", file.name);
      return { url: file.url };
    }),

  // Restaurant gallery uploader (multiple images)
  restaurantGallery: f({ image: { maxFileSize: "8MB", maxFileCount: 10 } })
    .middleware(async () => {
      const { userId } = await auth();
      if (!userId) throw new Error("Unauthorized");
      return { userId };
    })
    .onUploadComplete(async ({ metadata, file }) => {
      console.log("Gallery image uploaded by user:", metadata.userId);
      console.log("File URL:", file.url);
      return { url: file.url };
    }),
} satisfies FileRouter;

export type OurFileRouter = typeof ourFileRouter;
