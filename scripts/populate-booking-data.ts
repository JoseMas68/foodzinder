import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// Tu clerk ID - asegúrate de que sea el correcto
const YOUR_CLERK_ID = "user_2qVTLHJKlMJz5QzP7W0VHsLe5YT"; // Actualiza si es necesario

async function main() {
  console.log("🚀 Iniciando población de datos de reservas...\n");

  // 1. Obtener o crear tu usuario
  let yourUser = await prisma.user.findUnique({
    where: { clerkId: YOUR_CLERK_ID },
  });

  if (!yourUser) {
    console.log("❌ No se encontró tu usuario. Creándolo...");
    yourUser = await prisma.user.create({
      data: {
        clerkId: YOUR_CLERK_ID,
        email: "jose@foodzinder.com",
        firstName: "Jose",
        lastName: "Admin",
        role: "OWNER",
      },
    });
    console.log("✅ Usuario creado:", yourUser.email);
  } else {
    // Actualizar rol a OWNER si no lo es
    if (yourUser.role !== "OWNER") {
      yourUser = await prisma.user.update({
        where: { id: yourUser.id },
        data: { role: "OWNER" },
      });
      console.log("✅ Usuario actualizado a OWNER");
    }
  }

  // 2. Obtener todos los restaurantes
  const restaurants = await prisma.restaurant.findMany({
    include: {
      openingHours: true,
      tables: true,
    },
  });

  console.log(`\n📊 Encontrados ${restaurants.length} restaurantes\n`);

  // 3. Asignarte como dueño de 5-7 restaurantes aleatorios
  const restaurantsToOwn = restaurants
    .sort(() => Math.random() - 0.5)
    .slice(0, Math.floor(Math.random() * 3) + 5); // 5-7 restaurantes

  console.log(`👤 Asignándote como dueño de ${restaurantsToOwn.length} restaurantes...\n`);

  for (const restaurant of restaurantsToOwn) {
    await prisma.restaurant.update({
      where: { id: restaurant.id },
      data: { ownerId: yourUser.id },
    });
    console.log(`   ✓ ${restaurant.name}`);
  }

  // 4. Crear horarios de apertura para restaurantes que no los tengan
  console.log("\n🕐 Creando horarios de apertura...\n");

  const scheduleTemplates = [
    // Horario típico restaurante (cerrado lunes)
    {
      name: "Típico (cerrado lunes)",
      schedule: [
        { day: 0, open: "12:00", close: "23:00" }, // Domingo
        { day: 1, closed: true }, // Lunes cerrado
        { day: 2, open: "12:00", close: "23:00" },
        { day: 3, open: "12:00", close: "23:00" },
        { day: 4, open: "12:00", close: "23:00" },
        { day: 5, open: "12:00", close: "00:00" }, // Viernes hasta medianoche
        { day: 6, open: "12:00", close: "00:00" }, // Sábado hasta medianoche
      ],
    },
    // Abierto todos los días
    {
      name: "Siempre abierto",
      schedule: Array.from({ length: 7 }, (_, i) => ({
        day: i,
        open: "11:00",
        close: "23:30",
      })),
    },
    // Cerrado domingo y lunes
    {
      name: "Cerrado dom-lun",
      schedule: [
        { day: 0, closed: true },
        { day: 1, closed: true },
        { day: 2, open: "13:00", close: "23:00" },
        { day: 3, open: "13:00", close: "23:00" },
        { day: 4, open: "13:00", close: "23:00" },
        { day: 5, open: "13:00", close: "00:00" },
        { day: 6, open: "13:00", close: "00:00" },
      ],
    },
  ];

  for (const restaurant of restaurants) {
    if (restaurant.openingHours.length === 0) {
      const template =
        scheduleTemplates[Math.floor(Math.random() * scheduleTemplates.length)];

      const hoursData = template.schedule.map((day) => ({
        restaurantId: restaurant.id,
        dayOfWeek: day.day,
        openTime: day.closed ? null : day.open,
        closeTime: day.closed ? null : day.close,
        isClosed: day.closed || false,
      }));

      await prisma.openingHour.createMany({ data: hoursData });
      console.log(`   ✓ ${restaurant.name} - ${template.name}`);
    }
  }

  // 5. Crear mesas para restaurantes que no las tengan
  console.log("\n🪑 Creando mesas para restaurantes...\n");

  const tableShapes = ["SQUARE", "ROUND", "RECTANGLE", "BOOTH"] as const;
  const tableAreas = ["Interior", "Terraza", "Privado", "Barra", "Salón"] as const;

  for (const restaurant of restaurants) {
    if (restaurant.tables.length === 0) {
      const numTables = Math.floor(Math.random() * 8) + 8; // 8-15 mesas
      const tables = [];

      for (let i = 1; i <= numTables; i++) {
        const capacity = [2, 2, 4, 4, 4, 6, 6, 8][Math.floor(Math.random() * 8)];
        const minCapacity = capacity === 2 ? 1 : capacity === 4 ? 2 : capacity === 6 ? 4 : 6;

        tables.push({
          restaurantId: restaurant.id,
          tableNumber: `${i}`,
          capacity,
          minCapacity,
          shape: tableShapes[Math.floor(Math.random() * tableShapes.length)],
          area: tableAreas[Math.floor(Math.random() * tableAreas.length)],
          isActive: true,
        });
      }

      await prisma.table.createMany({ data: tables });
      console.log(`   ✓ ${restaurant.name} - ${numTables} mesas`);
    }
  }

  // 6. Crear algunos usuarios clientes ficticios
  console.log("\n👥 Creando usuarios clientes ficticios...\n");

  const fakeCustomers = [
    { firstName: "María", lastName: "García", email: "maria.garcia@example.com" },
    { firstName: "Carlos", lastName: "López", email: "carlos.lopez@example.com" },
    { firstName: "Ana", lastName: "Martínez", email: "ana.martinez@example.com" },
    { firstName: "David", lastName: "Rodríguez", email: "david.rodriguez@example.com" },
    { firstName: "Laura", lastName: "Fernández", email: "laura.fernandez@example.com" },
    { firstName: "Javier", lastName: "Sánchez", email: "javier.sanchez@example.com" },
    { firstName: "Carmen", lastName: "Pérez", email: "carmen.perez@example.com" },
    { firstName: "Miguel", lastName: "Gómez", email: "miguel.gomez@example.com" },
  ];

  const createdCustomers = [];
  for (const customer of fakeCustomers) {
    const existing = await prisma.user.findUnique({
      where: { email: customer.email },
    });

    if (!existing) {
      const user = await prisma.user.create({
        data: {
          clerkId: `fake_${customer.email}`,
          email: customer.email,
          firstName: customer.firstName,
          lastName: customer.lastName,
          role: "USER",
        },
      });
      createdCustomers.push(user);
      console.log(`   ✓ ${customer.firstName} ${customer.lastName}`);
    } else {
      createdCustomers.push(existing);
    }
  }

  // 7. Crear reservas ficticias
  console.log("\n📅 Creando reservas ficticias...\n");

  const statuses = ["PENDING", "CONFIRMED", "COMPLETED", "CANCELLED"] as const;
  const today = new Date();
  const reservationsCreated: { [key: string]: number } = {};

  for (const restaurant of restaurants) {
    const tables = await prisma.table.findMany({
      where: { restaurantId: restaurant.id },
    });

    if (tables.length === 0) continue;

    const numReservations = Math.floor(Math.random() * 10) + 5; // 5-15 reservas por restaurante
    reservationsCreated[restaurant.name] = 0;

    for (let i = 0; i < numReservations; i++) {
      // Fechas variadas: pasadas, hoy, futuras
      const daysOffset = Math.floor(Math.random() * 60) - 30; // -30 a +30 días
      const bookingDate = new Date(today);
      bookingDate.setDate(bookingDate.getDate() + daysOffset);

      // Hora aleatoria entre 12:00 y 22:00
      const hour = Math.floor(Math.random() * 10) + 12;
      const minute = [0, 30][Math.floor(Math.random() * 2)];
      const time = `${hour.toString().padStart(2, "0")}:${minute.toString().padStart(2, "0")}`;

      // Número de personas
      const partySize = [2, 2, 2, 4, 4, 4, 6, 8][Math.floor(Math.random() * 8)];

      // Mesa adecuada
      const suitableTables = tables.filter(
        (t) => t.capacity >= partySize && t.minCapacity <= partySize
      );

      if (suitableTables.length === 0) continue;

      const table = suitableTables[Math.floor(Math.random() * suitableTables.length)];

      // Cliente (50% usuarios registrados, 50% invitados)
      const isRegistered = Math.random() > 0.5;
      const customer = isRegistered
        ? createdCustomers[Math.floor(Math.random() * createdCustomers.length)]
        : null;

      // Estado según fecha
      let status: (typeof statuses)[number];
      if (daysOffset < -2) {
        // Pasadas: 70% completadas, 20% canceladas, 10% no-show
        const rand = Math.random();
        if (rand < 0.7) status = "COMPLETED";
        else if (rand < 0.9) status = "CANCELLED";
        else status = "COMPLETED"; // Usar COMPLETED en lugar de NO_SHOW por simplicidad
      } else if (daysOffset < 0) {
        // Recientes: 80% confirmadas, 20% pendientes
        status = Math.random() > 0.2 ? "CONFIRMED" : "PENDING";
      } else {
        // Futuras: 60% confirmadas, 40% pendientes
        status = Math.random() > 0.4 ? "CONFIRMED" : "PENDING";
      }

      try {
        await prisma.booking.create({
          data: {
            restaurantId: restaurant.id,
            userId: customer?.id || null,
            tableId: table.id,
            date: bookingDate,
            time,
            partySize,
            status,
            customerName: customer
              ? `${customer.firstName} ${customer.lastName}`
              : `${fakeCustomers[Math.floor(Math.random() * fakeCustomers.length)].firstName} Invitado`,
            customerEmail: customer?.email || `invitado${i}@example.com`,
            customerPhone: `+34 ${Math.floor(Math.random() * 900000000) + 600000000}`,
            specialNotes:
              Math.random() > 0.7
                ? [
                    "Alergia a los frutos secos",
                    "Mesa cerca de la ventana por favor",
                    "Cumpleaños, ¿tienen tarta?",
                    "Preferimos zona tranquila",
                    "Silla de bebé necesaria",
                  ][Math.floor(Math.random() * 5)]
                : null,
          },
        });
        reservationsCreated[restaurant.name]++;
      } catch (error) {
        // Ignorar conflictos de horarios
        continue;
      }
    }
  }

  console.log("\n📊 Resumen de reservas creadas:");
  for (const [name, count] of Object.entries(reservationsCreated)) {
    if (count > 0) {
      console.log(`   ${name}: ${count} reservas`);
    }
  }

  console.log("\n✅ ¡Población de datos completada!\n");
  console.log("📋 Resumen:");
  console.log(`   • Restaurantes de tu propiedad: ${restaurantsToOwn.length}`);
  console.log(`   • Usuarios clientes: ${createdCustomers.length}`);
  console.log(
    `   • Total de reservas: ${Object.values(reservationsCreated).reduce((a, b) => a + b, 0)}`
  );
  console.log("\n🎉 ¡Listo para probar el sistema de reservas!\n");
}

main()
  .catch((e) => {
    console.error("❌ Error:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
