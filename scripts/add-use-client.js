const fs = require('fs');
const path = require('path');

// Directorios a procesar
const dirsToProcess = [
  'src/components/features',
  'src/components/home',
  'src/components/favorites',
  'src/components/reviews',
  'src/components/bookings',
  'src/components/tables',
  'src/components/booking-services',
  'src/components/dashboard',
  'src/components/auth',
  'src/components/email-templates'
];

// Patrones que indican que un componente necesita "use client"
const clientPatterns = [
  /from ['"]@\/components\/ui\/button['"]/,
  /from ['"]lucide-react['"]/,
  /useState|useEffect|useRef|useCallback|useMemo/,
  /onClick|onChange|onSubmit|onFocus|onBlur/,
  /from ['"]@\/components\/favorites\/favorite-button['"]/,
  /from ['"]next\/navigation['"]/
];

function shouldHaveUseClient(content) {
  // Si ya tiene "use client", no hacer nada
  if (content.trim().startsWith('"use client"') || content.trim().startsWith("'use client'")) {
    return false;
  }

  // Verificar si coincide con algún patrón
  return clientPatterns.some(pattern => pattern.test(content));
}

function addUseClient(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');

  if (!shouldHaveUseClient(content)) {
    return false;
  }

  const newContent = '"use client";\n\n' + content;
  fs.writeFileSync(filePath, newContent, 'utf8');
  return true;
}

function processDirectory(dir) {
  const fullPath = path.join(process.cwd(), dir);

  if (!fs.existsSync(fullPath)) {
    console.log(`Directorio no encontrado: ${dir}`);
    return;
  }

  const files = fs.readdirSync(fullPath, { recursive: true });
  let modified = 0;

  files.forEach(file => {
    const filePath = path.join(fullPath, file);

    if (fs.statSync(filePath).isFile() && (file.endsWith('.tsx') || file.endsWith('.ts'))) {
      if (addUseClient(filePath)) {
        console.log(`✓ Agregado "use client" a: ${path.relative(process.cwd(), filePath)}`);
        modified++;
      }
    }
  });

  return modified;
}

// Procesar todos los directorios
console.log('Agregando "use client" a componentes interactivos...\n');
let totalModified = 0;

dirsToProcess.forEach(dir => {
  console.log(`Procesando ${dir}...`);
  const count = processDirectory(dir);
  totalModified += count;
});

console.log(`\n✅ Total de archivos modificados: ${totalModified}`);
