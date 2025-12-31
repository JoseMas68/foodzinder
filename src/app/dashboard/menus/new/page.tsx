import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { MenuForm } from "@/components/dashboard/menus/menu-form";

export default async function NewMenuPage() {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    redirect("/");
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-heading font-bold">Crear Nuevo Menú</h1>
        <p className="text-gray-500 mt-1">
          Añade un nuevo menú para tus restaurantes
        </p>
      </div>

      <MenuForm />
    </div>
  );
}
