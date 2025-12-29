# 🤖 Agentes de Foodzinder

Esta carpeta contiene la configuración y definición de todos los agentes especializados del proyecto **Foodzinder**.

## 📁 Estructura

```
.claude/
├── README.md                  # Este archivo
├── agents-config.md           # Configuración centralizada de agentes
└── agents/                    # Definiciones individuales de agentes
    ├── architect.md           # Meta-Agent / Orquestador
    ├── core-api.md            # Backend & API Specialist
    ├── pixel-perfect.md       # Frontend & UX/UI Specialist
    ├── schema-keeper.md       # Database & Integrity Specialist
    ├── sentinel.md            # Security & Compliance Specialist
    ├── growth-bot.md          # SEO & Analytics Specialist
    ├── bug-hunter.md          # Testing & QA Specialist
    ├── scribe.md              # Documentation Specialist
    └── ops-master.md          # Deployment & DevOps Specialist
```

## 🎯 Agentes Disponibles

### 1. The Architect 🏛️
**Meta-Agent / Orquestador**
- Supervisión global del proyecto
- Toma de decisiones arquitectónicas
- Orquestación de sub-agentes

### 2. CoreAPI 🔧
**Backend & API Specialist**
- Implementación de Server Actions
- Integraciones (Stripe, Clerk)
- Validación de datos

### 3. PixelPerfect 🎨
**Frontend & UX/UI Specialist**
- Componentes React reutilizables
- Diseño responsive
- Optimización de Core Web Vitals

### 4. SchemaKeeper 🗄️
**Database & Integrity Specialist**
- Gestión del schema Prisma
- Migraciones PostgreSQL
- Optimización de índices

### 5. Sentinel 🔐
**Security & Compliance Specialist**
- Auditoría de seguridad
- Cumplimiento GDPR/Fiscal
- Sanitización de inputs

### 6. GrowthBot 📈
**SEO & Analytics Specialist**
- Metadatos dinámicos
- Datos estructurados (JSON-LD)
- Google Analytics

### 7. BugHunter 🐛
**Testing & QA Specialist**
- Tests unitarios y E2E
- Prevención de regresiones
- Aseguramiento de calidad

### 8. Scribe 📝
**Documentation Specialist**
- Mantenimiento de docs
- Diagramas Mermaid
- Base de conocimiento

### 9. OpsMaster ⚙️
**Deployment & DevOps Specialist**
- CI/CD y GitHub Actions
- Gestión de infraestructura
- Monitoreo de servidores

## 🚀 Cómo Usar

### Para invocar un agente específico:

1. **Lee la definición del agente** en `agents/[agent-name].md`
2. **Prepara tu prompt** con contexto específico de la tarea
3. **Invoca el agente** a través de Claude Code

### Ejemplo:

Para trabajar en una nueva página del frontend:

1. Lee: [pixel-perfect.md](agents/pixel-perfect.md)
2. Proporciona contexto: "Necesito crear un componente de lista de restaurantes"
3. El agente PixelPerfect te guiará en el diseño e implementación

## 📋 Principios de Diseño

Todos los agentes respetan estos principios:

- **Escalabilidad**: Código preparado para crecer
- **Seguridad**: RLS, validación, cifrado
- **UX "Wow"**: Diseño hermoso e intuitivo
- **Mantenibilidad**: Tests y documentación clara

## 🛠️ Stack Tecnológico

- **Frontend**: Next.js 15, React 19, Tailwind CSS, Framer Motion
- **Backend**: Next.js Server Actions, TypeScript, Zod
- **Database**: PostgreSQL v17, Prisma ORM
- **Auth**: Clerk
- **Payments**: Stripe
- **Testing**: Jest, Playwright
- **Deployment**: Vercel / VPS (Easypanel)

## 🔗 Referencias

- [Configuración de Agentes](agents-config.md)
- [Planificación](../docs/planificacion.md)
- [Arquitectura](../docs/arquitectura.md)
- [Modelado de Datos](../docs/modelado-de-datos.md)

