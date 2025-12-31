import { createRouteHandler } from "uploadthing/next";
import { ourFileRouter } from "@/server/uploadthing";

export const { GET, POST } = createRouteHandler({
  router: ourFileRouter,
  config: {
    callbackUrl: `${process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"}/api/uploadthing`,
  },
});
