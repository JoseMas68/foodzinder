/**
 * Reemplazar variables en el template HTML
 * Ej: {{customerName}} -> "Juan Pérez"
 * Ej: {{#if tableNumber}}Mesa {{tableNumber}}{{/if}} -> "Mesa 5" o ""
 */
export function replaceTemplateVariables(
  htmlContent: string,
  variables: Record<string, any>
): string {
  let result = htmlContent;

  // Reemplazar variables simples {{variable}}
  Object.entries(variables).forEach(([key, value]) => {
    const regex = new RegExp(`{{${key}}}`, "g");
    result = result.replace(regex, value || "");
  });

  // Manejar condicionales {{#if variable}}...{{/if}}
  result = result.replace(/{{#if\s+(\w+)}}([\s\S]*?){{\/if}}/g, (_match, varName, content) => {
    return variables[varName] ? content : "";
  });

  return result;
}
