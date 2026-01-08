--
-- PostgreSQL database dump
--

\restrict cqcfLbEeegQMdWiKOHKwWgbXohQVrEd3VDp4kzsEoIm7K0wnZx9VEFAS6ZusVEJ

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."User" VALUES ('cmju3r7x40001jynhiqbwsno4', 'user_37XHpg3ie8ga8RKeF1yHMpeotN1', 'josemas68@gmail.com', 'jose', 'mas', 'ADMIN', NULL, NULL, NULL, NULL, '2025-12-31 14:19:28.601', '2025-12-31 20:11:52.186');
INSERT INTO public."User" VALUES ('cmjw0e9tf0000pawbguthtiyz', 'user_2qVTLHJKlMJz5QzP7W0VHsLe5YT', 'jose@foodzinder.com', 'Jose', 'Admin', 'OWNER', NULL, NULL, NULL, NULL, '2026-01-01 22:20:58.034', '2026-01-01 22:20:58.034');
INSERT INTO public."User" VALUES ('cmjw0jj0s0000mizjl9xsycl8', 'fake_maria.garcia@example.com', 'maria.garcia@example.com', 'María', 'García', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.244', '2026-01-01 22:25:03.244');
INSERT INTO public."User" VALUES ('cmjw0jj270001mizjrndtq19q', 'fake_carlos.lopez@example.com', 'carlos.lopez@example.com', 'Carlos', 'López', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.295', '2026-01-01 22:25:03.295');
INSERT INTO public."User" VALUES ('cmjw0jj2j0002mizjdn003odp', 'fake_ana.martinez@example.com', 'ana.martinez@example.com', 'Ana', 'Martínez', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.308', '2026-01-01 22:25:03.308');
INSERT INTO public."User" VALUES ('cmjw0jj320003mizjo8ymq3lu', 'fake_david.rodriguez@example.com', 'david.rodriguez@example.com', 'David', 'Rodríguez', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.326', '2026-01-01 22:25:03.326');
INSERT INTO public."User" VALUES ('cmjw0jj3d0004mizjlgsb5s7q', 'fake_laura.fernandez@example.com', 'laura.fernandez@example.com', 'Laura', 'Fernández', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.337', '2026-01-01 22:25:03.337');
INSERT INTO public."User" VALUES ('cmjw0jj3p0005mizj19j864z4', 'fake_javier.sanchez@example.com', 'javier.sanchez@example.com', 'Javier', 'Sánchez', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.35', '2026-01-01 22:25:03.35');
INSERT INTO public."User" VALUES ('owner_001', 'clerk_owner_001', 'juan@restaurant.com', 'Juan', 'García', 'OWNER', NULL, NULL, NULL, NULL, '2025-12-31 04:09:03.477', '2025-12-31 04:09:03.477');
INSERT INTO public."User" VALUES ('owner_002', 'clerk_owner_002', 'maria@restaurant.com', 'María', 'López', 'OWNER', NULL, NULL, NULL, NULL, '2025-12-31 04:09:03.482', '2025-12-31 04:09:03.482');
INSERT INTO public."User" VALUES ('user_001', 'clerk_user_001', 'carlos@example.com', 'Carlos', 'Martínez', 'USER', NULL, NULL, NULL, NULL, '2025-12-31 04:09:03.486', '2025-12-31 04:09:03.486');
INSERT INTO public."User" VALUES ('user_002', 'clerk_user_002', 'ana@example.com', 'Ana', 'Rodríguez', 'USER', NULL, NULL, NULL, NULL, '2025-12-31 04:09:03.494', '2025-12-31 04:09:03.494');
INSERT INTO public."User" VALUES ('cmjw0jj420006mizjdyc8lpl3', 'fake_carmen.perez@example.com', 'carmen.perez@example.com', 'Carmen', 'Pérez', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.363', '2026-01-01 22:25:03.363');
INSERT INTO public."User" VALUES ('cmjw0jj4g0007mizj541ffey5', 'fake_miguel.gomez@example.com', 'miguel.gomez@example.com', 'Miguel', 'Gómez', 'USER', NULL, NULL, NULL, NULL, '2026-01-01 22:25:03.377', '2026-01-01 22:25:03.377');
INSERT INTO public."User" VALUES ('admin_001', 'user_37q0HijW3e073lf3bUn7rsjLdOh', 'admin@foodzinder.com', 'Admin', 'Foodzinder', 'ADMIN', NULL, NULL, NULL, NULL, '2025-12-31 04:09:03.463', '2026-01-05 12:23:01.217');
INSERT INTO public."User" VALUES ('cmk140hft00018eqx1ujykw40', 'user_37q0M7O2TIAwm1cSbLeEk5LMeHG', 'owner@foodzinder.com', 'Owner', 'Restaurant', 'OWNER', NULL, NULL, NULL, NULL, '2026-01-05 12:01:04.073', '2026-01-05 12:23:01.222');
INSERT INTO public."User" VALUES ('cmk140hgg00028eqxk6hh6w0i', 'user_37q0PU4xheZ6VJPFNAvSqFBx4kH', 'user@foodzinder.com', 'Usuario', 'Prueba', 'USER', NULL, NULL, NULL, NULL, '2026-01-05 12:01:04.096', '2026-01-05 12:23:01.229');


--
-- Data for Name: Restaurant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Restaurant" VALUES ('551b0921-a0e1-479f-94b6-949f91ec7fcf', 'Trattoria Bella Napoli', 'trattoria-bella-napoli', 'Auténtica cocina napolitana. Pizza en horno de piedra, pasta fresca casera y postres tradicionales italianos.', 'Calle Goya 32, Barcelona', 41.3851, 2.1734, 'APPROVED', 'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=1200&h=600&fit=crop', 'MODERATE', '+34 933 678 901', 'https://bellanapoli.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.295', '2026-01-01 22:24:11.663');
INSERT INTO public."Restaurant" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', 'Burger Haven', 'burger-haven', 'Hamburguesas gourmet con ingredientes premium. La mejor carne angus de la región.', 'Gran Vía 56, Madrid', 40.419, -3.7, 'APPROVED', 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=200', 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=800', 'MODERATE', NULL, NULL, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:09:03.694', '2026-01-02 13:58:30.55');
INSERT INTO public."Restaurant" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'Sushi Master', 'sushi-master', 'Experiencia japonesa auténtica. Sushi y sashimi de la más alta calidad.', 'Avenida Diagonal 123, Barcelona', 41.3851, 2.1734, 'APPROVED', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=200', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=800', 'EXPENSIVE', NULL, NULL, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:09:03.681', '2026-01-02 13:58:30.642');
INSERT INTO public."Restaurant" VALUES ('145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'Mesón Castellano', 'meson-castellano', 'Cocina castellana de toda la vida. Cordero asado, cochinillo y sopa castellana en horno de leña tradicional.', 'Plaza Mayor 3, Segovia', 40.9429, -4.1088, 'APPROVED', 'https://images.unsplash.com/photo-1551218808-94e220e084d2?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?w=1200&h=600&fit=crop', 'MODERATE', '+34 921 567 890', 'https://mesoncastellano.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.28', '2026-01-01 22:25:02.973');
INSERT INTO public."Restaurant" VALUES ('9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'La Trattoria di Roma', 'la-trattoria-di-roma', 'Auténtica cocina italiana en el corazón de la ciudad. Pasta fresca hecha a mano todos los días.', 'Calle Mayor 45, Madrid', 40.4168, -3.7038, 'APPROVED', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=200', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800', 'MODERATE', NULL, NULL, 'owner_001', '2025-12-31 04:09:03.659', '2025-12-31 13:24:10.223');
INSERT INTO public."Restaurant" VALUES ('853c16e3-6906-4985-afad-211880a60917', 'La Taberna del Abuelo', 'la-taberna-del-abuelo', 'Cocina tradicional española en un ambiente acogedor. Especialidades de la casa: cocido madrileño, paella valenciana y chuletón de buey.', 'Calle Mayor 28, Madrid', 40.4168, -3.7038, 'APPROVED', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1200&h=600&fit=crop', 'MODERATE', '+34 915 123 456', 'https://latabernadelabuelo.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.106', '2026-01-02 13:57:33.075');
INSERT INTO public."Restaurant" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', 'Tacos El Patrón', 'tacos-el-patron', 'Los mejores tacos de la ciudad. Recetas tradicionales mexicanas con un toque moderno.', 'Calle de Alcalá 78, Madrid', 40.42, -3.69, 'APPROVED', 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=200', 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=800', 'CHEAP', NULL, NULL, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:09:03.689', '2026-01-02 13:58:30.517');
INSERT INTO public."Restaurant" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', 'El Asador Vasco', 'el-asador-vasco', 'Cocina vasca tradicional. Chuletón a la brasa y pescado fresco del Cantábrico.', 'Paseo de la Castellana 90, Madrid', 40.43, -3.69, 'APPROVED', 'https://images.unsplash.com/photo-1544025162-d76694265947?w=200', 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800', 'LUXURY', NULL, NULL, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:09:03.708', '2026-01-02 13:58:30.538');
INSERT INTO public."Restaurant" VALUES ('fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'El Güero', 'el-guero', 'Street food mexicano. Quesadillas, tortas y elotes en un local informal y divertido.', 'Rambla del Raval 34, Barcelona', 41.3796, 2.1688, 'APPROVED', 'https://images.unsplash.com/photo-1625622266634-e0fd96d81426?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=1200&h=600&fit=crop', 'CHEAP', '+34 933 012 345', 'https://elguero.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.485', '2026-01-02 13:57:33.006');
INSERT INTO public."Restaurant" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', 'Il Giardino Toscano', 'il-giardino-toscano', 'Cocina toscana de alta gama. Carnes a la parrilla, pasta fresca y una extensa carta de vinos italianos.', 'Paseo de Gracia 67, Barcelona', 41.3922, 2.1649, 'APPROVED', 'https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=1200&h=600&fit=crop', 'LUXURY', '+34 933 901 234', 'https://ilgiardinotoscano.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.361', '2026-01-01 22:23:11.138');
INSERT INTO public."Restaurant" VALUES ('3442a830-784d-4344-a5ec-96653a1b7212', 'Casa Vasca', 'casa-vasca', 'Alta cocina vasca con productos de temporada. Especialidades: bacalao al pil-pil, txuleton y kokotxas de merluza.', 'Paseo de la Concha 7, San Sebastián', 43.3183, -1.9812, 'APPROVED', 'https://images.unsplash.com/photo-1592861956120-e524fc739696?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=1200&h=600&fit=crop', 'EXPENSIVE', '+34 943 345 678', 'https://casavasca.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.245', '2026-01-01 22:21:23.058');
INSERT INTO public."Restaurant" VALUES ('64e51b94-36d3-41e8-b6c0-8894153febae', 'Osteria del Centro', 'osteria-del-centro', 'Cocina italiana moderna con toques contemporáneos. Risotto de trufa, ossobuco y tiramisú de la casa.', 'Calle Serrano 89, Madrid', 40.4378, -3.6879, 'APPROVED', 'https://images.unsplash.com/photo-1579631542720-3a87824fff86?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?w=1200&h=600&fit=crop', 'EXPENSIVE', '+34 914 789 012', 'https://osteriadelcentro.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.311', '2026-01-01 22:25:03.018');
INSERT INTO public."Restaurant" VALUES ('de8b1efc-02b3-4184-a40e-9991956164ce', 'Pasta & Basta', 'pasta-y-basta', 'Restaurante casual italiano especializado en pasta fresca. Precios asequibles y ambiente familiar.', 'Calle Fuencarral 78, Madrid', 40.4267, -3.7007, 'APPROVED', 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=1200&h=600&fit=crop', 'CHEAP', '+34 915 012 345', 'https://pastaybasta.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.38', '2026-01-01 22:23:10.94');
INSERT INTO public."Restaurant" VALUES ('3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'Sake Sushi Bar', 'sake-sushi-bar', 'Sushi y sashimi de primera calidad. Pescado fresco traído diariamente de la lonja. Omakase disponible.', 'Calle Velázquez 45, Madrid', 40.4248, -3.6827, 'APPROVED', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=1200&h=600&fit=crop', 'EXPENSIVE', '+34 914 123 456', 'https://sakesushibar.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:11:58.724', '2026-01-01 22:25:02.992');
INSERT INTO public."Restaurant" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'Dragon Wok', 'dragon-wok', 'Cocina china tradicional y dim sum. Pato laqueado, dumplings caseros y noodles salteados al wok.', 'Calle Aribau 156, Barcelona', 41.3976, 2.1543, 'APPROVED', 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=1200&h=600&fit=crop', 'MODERATE', '+34 933 234 567', 'https://dragonwok.es', 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:11:58.86', '2026-01-01 18:29:46.366');
INSERT INTO public."Restaurant" VALUES ('beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'La Taquería Mexicana', 'la-taqueria-mexicana', 'Tacos auténticos estilo México DF. Carne asada, al pastor y carnitas con tortillas hechas a mano.', 'Calle Hortaleza 92, Madrid', 40.4289, -3.6976, 'APPROVED', 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1613514785940-daed07799d9b?w=1200&h=600&fit=crop', 'CHEAP', '+34 915 678 901', 'https://lataqueriamexicana.es', 'owner_001', '2025-12-31 04:10:51.396', '2025-12-31 13:25:56.956');
INSERT INTO public."Restaurant" VALUES ('ccb963c9-0da1-4961-8e96-98a60d9c5747', 'Mariachi Loco', 'mariachi-loco', 'Tex-Mex con ambiente festivo. Burritos gigantes, fajitas y margaritas. Mariachis los fines de semana.', 'Calle Cruz 15, Madrid', 40.4156, -3.7025, 'APPROVED', 'https://images.unsplash.com/photo-1604467707321-70d5ac45adda?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?w=1200&h=600&fit=crop', 'CHEAP', '+34 915 890 123', 'https://mariachiloco.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.431', '2026-01-02 13:57:33.093');
INSERT INTO public."Restaurant" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', 'Tulum Beach Club', 'tulum-beach-club', 'Cocina mexicana de autor con vistas al mar. Ceviches, tiraditos y coctelería tropical de lujo.', 'Paseo Marítimo 12, Marbella', 36.5101, -4.8842, 'APPROVED', 'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=1200&h=600&fit=crop', 'LUXURY', '+34 952 901 234', 'https://tulumbeachclub.com', 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:10:51.441', '2026-01-02 13:58:30.624');
INSERT INTO public."Restaurant" VALUES ('3da8e4f3-21c8-48e5-9af8-50a930803e78', 'Ramen House Tokio', 'ramen-house-tokio', 'Ramen japonés auténtico. Caldo cocinado durante 18 horas, fideos frescos hechos a mano diariamente.', 'Calle Ponzano 34, Madrid', 40.4413, -3.6966, 'APPROVED', 'https://images.unsplash.com/photo-1557872943-16a5ac26437e?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1623341214825-9f4f963727da?w=1200&h=600&fit=crop', 'CHEAP', '+34 915 456 789', 'https://ramenhousetokio.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:11:58.815', '2026-01-02 13:57:33.052');
INSERT INTO public."Restaurant" VALUES ('b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'Cantina del Sur', 'cantina-del-sur', 'Cocina mexicana tradicional y mezcalería. Mole poblano, cochinita pibil y más de 100 tipos de mezcal.', 'Calle Blai 45, Barcelona', 41.3745, 2.1669, 'APPROVED', 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=1200&h=600&fit=crop', 'MODERATE', '+34 933 789 012', 'https://cantinadelsur.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.413', '2026-01-02 13:57:33.086');
INSERT INTO public."Restaurant" VALUES ('12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'Izakaya Yuki', 'izakaya-yuki', 'Taberna japonesa tradicional. Yakitori, gyozas y sake premium en un ambiente auténtico.', 'Calle Muntaner 234, Barcelona', 41.4012, 2.1455, 'APPROVED', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=1200&h=600&fit=crop', 'MODERATE', '+34 933 123 456', 'https://izakayayuki.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:11:58.838', '2026-01-01 22:24:11.697');
INSERT INTO public."Restaurant" VALUES ('f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'Paella & Mar', 'paella-y-mar', 'Restaurante frente al mar especializado en arroces y mariscos valencianos. Paella tradicional cocinada con leña.', 'Paseo Marítimo 45, Valencia', 39.4699, -0.3763, 'APPROVED', 'https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1622973536968-3ead9e1d9e6b?w=1200&h=600&fit=crop', 'MODERATE', '+34 963 456 789', 'https://paellaymar.com', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.261', '2026-01-02 13:57:32.814');
INSERT INTO public."Restaurant" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', 'Pizzeria Da Marco', 'pizzeria-da-marco', 'Pizzería familiar con recetas traídas directamente de Roma. Masa madre de 48h de fermentación.', 'Avenida Diagonal 234, Barcelona', 41.3977, 2.1607, 'APPROVED', 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1571997478779-2adcbbe9ab2f?w=1200&h=600&fit=crop', 'CHEAP', '+34 932 890 123', 'https://pizzeriadamarco.com', 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 04:10:51.344', '2026-01-02 13:58:30.666');
INSERT INTO public."Restaurant" VALUES ('0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'El Rincón Andaluz', 'el-rincon-andaluz', 'Tapas y raciones andaluzas con el mejor ambiente flamenco. Prueba nuestros pescaítos fritos y salmorejo cordobés.', 'Plaza de España 15, Sevilla', 37.3891, -5.9845, 'APPROVED', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1544025162-d76694265947?w=1200&h=600&fit=crop', 'CHEAP', '+34 954 234 567', 'https://elrinconandaluz.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:10:51.166', '2026-01-01 22:24:11.556');
INSERT INTO public."Restaurant" VALUES ('b74c8030-7571-417a-9b97-e82b80b500a6', 'Casa Sichuan', 'casa-sichuan', 'Cocina de Sichuan auténtica. Platos picantes, mapo tofu y hot pot tradicional chino.', 'Calle Galileo 67, Madrid', 40.4319, -3.7083, 'ARCHIVED', 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&h=400&fit=crop', 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=1200&h=600&fit=crop', 'CHEAP', '+34 915 234 567', 'https://casasichuan.es', 'cmjw0e9tf0000pawbguthtiyz', '2025-12-31 04:11:58.906', '2026-01-02 21:51:18.289');


--
-- Data for Name: Table; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Table" VALUES ('45de265a-6b21-432d-930c-a9e8cf50fc76', '1', 10, 1, 'Terraza', 'ROUND', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-01 18:35:12.352', '2026-01-01 18:35:12.352');
INSERT INTO public."Table" VALUES ('b0ed2b4b-d7f5-40cc-ab65-dd8589baae3f', '3', 10, 4, 'VIP', 'BOOTH', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-01 18:38:09.863', '2026-01-01 18:38:09.863');
INSERT INTO public."Table" VALUES ('91aeec46-47b0-4ac0-9c20-ab110a20b6a9', '1', 2, 1, 'Interior', 'BOOTH', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('ffea957a-524c-4f40-beb6-c208dc28fca0', '2', 2, 1, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('2744de37-02d8-4faf-aa00-5bbc971cd909', '3', 6, 4, 'Terraza', 'ROUND', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('3e41b965-557f-4d5b-bc32-ec5a1c06582a', '4', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('a1333a49-9f88-4cd5-8df2-64a9be1161cf', '5', 2, 1, 'Interior', 'SQUARE', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('5d4aa0ee-0ae0-4cc3-812b-09f9f865b98d', '6', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('2b129dae-0f26-4ba8-813f-b5ba5c17b1f9', '7', 2, 1, 'Salón', 'BOOTH', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('ee2996f6-0295-498b-882b-ac4983d83afe', '8', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('1df35ef6-f148-4089-b6ee-e5288a84aa15', '9', 6, 4, 'Privado', 'ROUND', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('dc1b286a-fa0d-4037-8ccb-6eea1451768c', '10', 6, 4, 'Terraza', 'ROUND', true, NULL, NULL, 0, '853c16e3-6906-4985-afad-211880a60917', '2026-01-01 22:24:11.719', '2026-01-01 22:24:11.719');
INSERT INTO public."Table" VALUES ('053d0c87-f41f-4189-9c95-7767d63fcbae', '1', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('88063b12-43cc-425f-a15c-46993b5d2feb', '2', 2, 1, 'Privado', 'SQUARE', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('182f212d-5b04-4ed4-bbb1-5c62cb0f5bfe', '3', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('390eb5e9-e5a8-4ed8-b4f9-935bbf6e8f0b', '4', 2, 1, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('e0afdedf-d89b-4895-910f-d7701c6bcd0f', '5', 2, 1, 'Barra', 'SQUARE', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('859f31c5-4859-4402-a806-20f94cb52e01', '6', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('a9e5f96f-d6be-40cf-a58a-54d146704c58', '7', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('2d5ab711-3146-497e-b294-c3132c7f1868', '8', 4, 2, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('57e68a8a-44ff-4633-ad1d-d1658511ce25', '9', 8, 6, 'Barra', 'BOOTH', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('1a3adc62-d52e-4db0-ada3-9f04687bd816', '10', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, '0871b5a0-9cc8-46ba-8aff-41e294c4f613', '2026-01-01 22:24:11.781', '2026-01-01 22:24:11.781');
INSERT INTO public."Table" VALUES ('571e208e-603c-4acd-a386-bd3ad9d704a5', '1', 2, 1, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('f8bba46d-0a12-44a8-a24b-ed50bb069ca2', '2', 8, 6, 'Barra', 'ROUND', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('930b7290-6e47-41b4-a283-a4ed38c4a980', '3', 8, 6, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('efd3665b-9e2d-4be5-b5ab-e33547dfdf63', '4', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('1c906cf8-f85c-4d11-ab03-e95fe32030d2', '5', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('421232b4-8ef9-4a5d-bb17-d4db8b8d26e7', '6', 4, 2, 'Barra', 'SQUARE', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('932ebf6d-b3d7-4c8d-852b-c15809f46261', '7', 4, 2, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('50fcd0f2-6306-4316-adbd-329f54d2c2c8', '8', 4, 2, 'Interior', 'ROUND', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('9baba8ba-9eae-40ed-a2c4-68d3c2939e9a', '9', 2, 1, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('3f8ef646-77ad-4c0a-b2b9-7f3c6db89177', '10', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '2026-01-01 22:24:11.8', '2026-01-01 22:24:11.8');
INSERT INTO public."Table" VALUES ('fec582a6-8d3a-405e-99ae-ffd12bf8b046', '1', 2, 1, 'Terraza', 'ROUND', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('bcc72b17-f25b-44f1-b1c3-7305ffdbc636', '2', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('119c9f6b-c20b-479f-a157-3e9a76e6570b', '3', 6, 4, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('469389db-14f9-4235-a6e4-478e1c0d4d92', '4', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('0649b1ae-3621-49cc-93c1-871f517d904b', '5', 6, 4, 'Salón', 'SQUARE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('89fa79b5-159b-4767-a295-eba10c0db8fc', '6', 8, 6, 'Terraza', 'ROUND', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('fc99e8b2-9ce4-43b9-b9a7-a7134eabd7bf', '7', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('89513e7f-4779-4166-89a6-c308200ce7e3', '8', 6, 4, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('032a391e-0f7d-401f-84fc-0a8192ae6b2a', '9', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('66bbd22c-ac5e-4f84-914a-4b408a95613f', '10', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b', '11', 6, 4, 'Privado', 'SQUARE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('152d7ab8-d71f-4543-b3ee-a7a987f51798', '2', 8, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-01 18:37:37.66', '2026-01-03 04:58:05.619');
INSERT INTO public."Table" VALUES ('c0533e7b-5004-4110-83a9-65f412e2208a', '4', 4, 1, 'Interior', 'SQUARE', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-01 18:57:55.523', '2026-01-03 04:58:07.857');
INSERT INTO public."Table" VALUES ('0cd0212e-d4f1-4283-bf27-f4427dde3151', '6', 4, 1, 'Interior', 'SQUARE', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-01 18:58:28.95', '2026-01-03 04:58:08.835');
INSERT INTO public."Table" VALUES ('399a9e1e-2500-4a0b-ba5b-b4703cdd3f37', '12', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('1a19ad7e-e442-49f8-9061-fd98c6c3076c', '13', 8, 6, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('ac8956b8-1e45-41d0-b633-40b124a23143', '14', 8, 6, 'Interior', 'ROUND', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('14074581-d3f6-4ad3-91c8-620281048a03', '15', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '2026-01-01 22:24:11.81', '2026-01-01 22:24:11.81');
INSERT INTO public."Table" VALUES ('994c4887-19ee-473f-9d6b-5294100b5955', '1', 6, 4, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('2eaf8bb0-f42c-4bf5-8deb-cfa376a76a3f', '2', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('2ba650ac-ac76-4180-8e98-548f40dfae44', '3', 4, 2, 'Barra', 'ROUND', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('7a7ed376-2b30-4c42-a2cf-143bf00cc3b4', '4', 6, 4, 'Barra', 'SQUARE', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('81bc6536-c1b9-4ee0-99ae-c710c709c709', '5', 6, 4, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('1dff4493-2a32-4524-a496-0247865fd3a4', '6', 2, 1, 'Barra', 'BOOTH', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('0713436b-aad6-46bf-8c68-9283433e9ee1', '7', 6, 4, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('68534514-901e-4f1e-9309-5a770056b078', '8', 6, 4, 'Salón', 'BOOTH', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('97c0a815-a8a8-42a0-aacd-14e02d4f6dee', '9', 6, 4, 'Salón', 'ROUND', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('bdb6ea46-580b-408c-a72d-ccdf8160c719', '10', 4, 2, 'Terraza', 'ROUND', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('ddd9979e-d823-4ab4-8dbc-98d094211bf1', '11', 4, 2, 'Barra', 'ROUND', true, NULL, NULL, 0, '3da8e4f3-21c8-48e5-9af8-50a930803e78', '2026-01-01 22:24:11.857', '2026-01-01 22:24:11.857');
INSERT INTO public."Table" VALUES ('3517fd5a-0fcf-4ff1-acc1-63bd6afe1bc9', '1', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('d3b6b40b-22f3-4b22-9cb1-415ef42ea09e', '2', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('a6c00fd5-fedb-46e7-9d63-e2da94f9afc9', '3', 6, 4, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('cadc5def-6f61-4bce-b7b1-14f69f33c841', '4', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('c9b1fedd-f2eb-4b60-a29f-d1f63140173a', '5', 4, 2, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('c7846d56-25e6-41da-a94f-79e4838df9d4', '6', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('f623b8f4-1235-4730-bccf-4c4a0683042c', '7', 2, 1, 'Salón', 'ROUND', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('8b19f763-090a-4053-a89b-53c95cb7517c', '8', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('4fcf92ef-3b41-4967-a400-71a9549e9360', '9', 8, 6, 'Salón', 'BOOTH', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('6a3b7447-ed10-4cbe-b6fc-115b223c18da', '10', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('4021b3f9-a599-4aca-b87a-5ac59abdd3a3', '11', 4, 2, 'Salón', 'SQUARE', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('3b1d0a7f-a211-4a86-b37f-1e87da41523a', '12', 4, 2, 'Salón', 'BOOTH', true, NULL, NULL, 0, '551b0921-a0e1-479f-94b6-949f91ec7fcf', '2026-01-01 22:24:11.873', '2026-01-01 22:24:11.873');
INSERT INTO public."Table" VALUES ('91a3855f-3a2f-421c-8fef-b481f85c6859', '1', 8, 6, 'Salón', 'BOOTH', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('8c47d1b6-a8f4-41d9-a954-5781f66ed165', '2', 6, 4, 'Salón', 'ROUND', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('3e6d3ff9-3fba-4098-bde6-7b0365e4385c', '3', 8, 6, 'Privado', 'SQUARE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('858b1ba7-209e-4703-b241-de2ba1dc9f5e', '4', 6, 4, 'Salón', 'ROUND', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('8ff401b6-f65d-49fc-b81a-7562d47e4e17', '5', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('a527c49f-8ee3-4dfd-912a-f39cb3f2dbf6', '6', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('7e44c66b-829c-4f25-87b6-5613c8657937', '7', 2, 1, 'Barra', 'SQUARE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('51342893-2162-4fde-96e1-7c4028f50e6c', '8', 4, 2, 'Barra', 'ROUND', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('859ca1b7-3a17-43a7-a300-660fc084f918', '9', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('844bd793-38b7-4f70-a7da-b96b94184878', '10', 2, 1, 'Salón', 'SQUARE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('fc1a7639-aa73-40b3-9b14-323ef6538de9', '11', 6, 4, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('d3b52840-c48c-4235-96cf-178bffce7074', '12', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('c7d80be7-2ebc-4c57-a352-141156a77801', '13', 4, 2, 'Interior', 'SQUARE', true, NULL, NULL, 0, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '2026-01-01 22:24:11.885', '2026-01-01 22:24:11.885');
INSERT INTO public."Table" VALUES ('f2b7e6e9-2925-493d-bb8f-c25687ac3921', '1', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('448f0deb-9dc6-4622-8d98-59eb55344910', '2', 8, 6, 'Barra', 'SQUARE', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('4acdcab3-6fdc-4ff6-ad6a-ec96d3236ed4', '3', 4, 2, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('5fb3ba3c-7a63-4ae0-be62-fd7003fa10f9', '4', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('19531aa8-7f3c-4391-a88d-4158f5382914', '5', 4, 2, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('a0953bd5-b199-49c6-b37c-66adc43339bf', '6', 8, 6, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('5f5902ca-c0f7-46d2-9b0b-1a87277b5cfe', '7', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('3f7a9251-2d3f-4ead-8650-0aea0e10cd37', '8', 6, 4, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '2026-01-01 22:24:11.899', '2026-01-01 22:24:11.899');
INSERT INTO public."Table" VALUES ('fecb1862-1447-4c15-a69b-4d834f59e544', '1', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('17ac494a-088a-4c18-8333-3f09ed59419c', '2', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('258d473f-78b7-4706-8d93-93f5d1437fe2', '3', 8, 6, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('b2ca6a30-b092-43b9-b2b4-6572d68f3333', '4', 2, 1, 'Barra', 'SQUARE', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('0e2a14eb-4ce6-4549-9714-e8c43ba2dd99', '5', 6, 4, 'Interior', 'SQUARE', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('4596075e-3525-459a-a3c3-54abcb6cfaf6', '6', 8, 6, 'Salón', 'BOOTH', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('e24cb642-e2dc-4232-a9cc-6b5a0660bc74', '7', 8, 6, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('ada903c3-5218-4693-8194-419ddd1f89ac', '8', 2, 1, 'Salón', 'ROUND', true, NULL, NULL, 0, '3442a830-784d-4344-a5ec-96653a1b7212', '2026-01-01 22:24:11.927', '2026-01-01 22:24:11.927');
INSERT INTO public."Table" VALUES ('9dca8696-1644-4058-9d8b-adaebc47e625', '1', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('b3ddbc38-f4af-421f-a77c-10631f929cf1', '2', 6, 4, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('5f264000-4a93-4718-b5d9-3dce4dffe947', '3', 6, 4, 'Salón', 'SQUARE', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('b28cd6be-5144-47a4-82ba-83f8dfb85927', '4', 2, 1, 'Privado', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('eceb48bd-b8ed-4f75-834b-0d9a67c53859', '5', 2, 1, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('8d16156e-a45a-4f5d-9356-fd8f67be1e1b', '6', 6, 4, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('fff8d93b-0f13-4185-8399-b2981fd32f18', '7', 4, 2, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('c0b47a38-4c1d-4eb2-8809-2a2a46fca380', '8', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('95cc2841-26e4-4696-a4f8-0f35eb87920e', '9', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('cfaeae61-75a1-4a3e-b34c-46795146b9d6', '10', 2, 1, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('aa6d62fd-e3c1-44e2-a4a0-2256b48887fd', '11', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('2f074522-b584-4c79-8e81-73a498851826', '12', 2, 1, 'Barra', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('d97a0e8f-b9d8-42bb-ab78-5775bc6d8250', '13', 8, 6, 'Privado', 'ROUND', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('cd3746fb-9062-493c-97d2-a83c2c4ac137', '14', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2026-01-01 22:24:11.942', '2026-01-01 22:24:11.942');
INSERT INTO public."Table" VALUES ('13a48c76-07f3-4516-851b-03848c7de98e', '1', 6, 4, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('5f3f01f3-7325-40bf-830d-bd2db168b0b7', '2', 4, 2, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('d6df436a-23a0-47de-b93c-94ed7d4b3e7f', '3', 4, 2, 'Interior', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('01eb5535-74de-43ee-b08b-acaddf876d0e', '4', 6, 4, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('f91cdfae-b3f6-49cb-a357-a243807d6f75', '5', 6, 4, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('6f479fb9-5b31-4ae9-8e19-1087cf6baa9c', '6', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('26623647-18aa-4373-9299-541f0e36673e', '7', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('5dc0c707-121c-44db-a185-ef58a5f0b089', '8', 8, 6, 'Salón', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('d15df445-1987-4f82-a9c8-3dc2f4ae2afc', '9', 2, 1, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('9f71791e-8e33-4097-abb2-0f6618a6d2c7', '10', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('6ea1a9ec-baa7-4918-a590-e110a90e392a', '11', 8, 6, 'Barra', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('65a07f55-b5e5-403a-a7d9-ef00e09a52a4', '12', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('33d45a78-3309-4df6-9165-3b0495defefc', '13', 8, 6, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('50397fd4-f669-4cd5-a5f2-af2fb7665faa', '14', 4, 2, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('19e2dce5-66d5-4418-87ad-4526decf1293', '15', 8, 6, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', '2026-01-01 22:24:11.96', '2026-01-01 22:24:11.96');
INSERT INTO public."Table" VALUES ('72975457-eac3-4cff-af11-0c7400afe87a', '1', 2, 1, 'Terraza', 'ROUND', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('c38ca693-0d72-436a-ba6e-7d11dace16e6', '2', 4, 2, 'Salón', 'SQUARE', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('f37edf7e-dfa9-434f-ae38-100489605fdd', '3', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('2cc8fed3-d29e-4d1d-a5b6-51ae30e46128', '4', 6, 4, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('b1c2d26d-578a-4c81-bdf9-7b263dae3f9e', '5', 8, 6, 'Interior', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('833eb749-6342-43ec-b18d-8f1f0b5f736f', '6', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('d64c1659-1a4b-4592-ab78-4523655b6bc4', '7', 6, 4, 'Salón', 'SQUARE', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('aec72ffd-2d0a-4fd3-b020-1fe80c911b85', '8', 8, 6, 'Terraza', 'ROUND', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('a0bca915-a8bd-4c1a-a77c-54495675e10f', '9', 2, 1, 'Interior', 'ROUND', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('a54bf8e2-c283-4d9e-a4b0-4aa5d0f2585e', '10', 8, 6, 'Interior', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('c443bd69-f472-4e17-877a-3b9efdfcde97', '11', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('fa0e25dc-adc6-4616-850d-086b489822b5', '12', 6, 4, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('e2e24a91-9cf9-45a7-b7f5-8f3fd191926c', '13', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('6a9c8396-2c93-4115-bf00-4a239fa0365d', '14', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:24:11.973', '2026-01-01 22:24:11.973');
INSERT INTO public."Table" VALUES ('2289e983-b4a8-4516-a620-a2ec517e3f6b', '1', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('ac3fae8e-defd-4458-963f-5dd252a4d0ba', '2', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('83004c73-92ff-420c-9361-646d451034e6', '3', 4, 2, 'Interior', 'ROUND', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('f786c3d7-ffc5-41ff-aff9-2734474e565b', '4', 4, 2, 'Terraza', 'ROUND', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('757f1f6d-3400-4eb4-84dd-adafa24075da', '5', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('148359bc-6078-412a-abe3-c6c96d35d61d', '6', 6, 4, 'Privado', 'ROUND', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('dd646088-79d2-4eb8-a4c4-8cdc3d0a5472', '7', 6, 4, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('cf70734a-32a0-4da0-90a0-e276155b98c4', '8', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('23674bbd-2633-4dcc-ade2-11bef18e0fa7', '9', 8, 6, 'Salón', 'ROUND', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('2b1c8153-1e8f-4d8b-b3e6-64f59f687e12', '10', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '64e51b94-36d3-41e8-b6c0-8894153febae', '2026-01-01 22:24:11.986', '2026-01-01 22:24:11.986');
INSERT INTO public."Table" VALUES ('7c866212-33c6-4106-bb43-0d6711a79f50', '1', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('41764399-bbe4-4ca1-b308-555c099de093', '2', 2, 1, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('4eee1e3d-1ee3-470b-93c8-dc13e3e91074', '3', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('6fb3bc6a-41aa-4715-b687-6ac4f4601e40', '4', 4, 2, 'Privado', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('c5d8b642-c77b-4ea0-8c33-a0af850c9961', '5', 8, 6, 'Barra', 'ROUND', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('17b49230-23f2-48f3-90be-d0507a75d4ac', '6', 6, 4, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('c5822f3a-aafe-4dfb-b014-1cea58f15420', '7', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('1e3e8593-7e6d-431d-9020-729ea5e7421b', '8', 4, 2, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('093528d7-d290-45ef-82b4-daf5439b69c1', '9', 4, 2, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('c7d82531-20be-4ad4-89f5-bff60ba8927f', '10', 6, 4, 'Privado', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('9f1f0fd6-3b6d-41d7-aaee-b35d8da0b22d', '11', 6, 4, 'Privado', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('2ff7ae34-993d-48fe-a9d2-f9ad1b1dbe94', '12', 4, 2, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('4a63621d-dbd2-41c7-8850-d18c11c53394', '13', 2, 1, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('9a32e157-b4b1-41ff-b735-0a446c993f96', '14', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('8e7ad85b-00c8-4bfb-beae-15dc4268f9a8', '15', 2, 1, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'eb4160e1-2708-466d-bd46-9b33fcaefd80', '2026-01-01 22:24:12.001', '2026-01-01 22:24:12.001');
INSERT INTO public."Table" VALUES ('62a03b58-1135-4b7d-ac0a-613456dcf215', '1', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('9f9eb72b-9364-46b6-93f7-98a3f876f1d4', '2', 4, 2, 'Barra', 'ROUND', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('75433366-3484-4e51-b185-98283a5b2751', '3', 6, 4, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('2f49eb6a-d037-4d89-bbf4-b23d13bfb7fd', '4', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('6b04cbec-0bfe-458d-823b-8ae777f5ee95', '5', 2, 1, 'Barra', 'SQUARE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('92c88ae1-dcdb-4e9f-94c4-40632529b307', '6', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('8a7f9151-c51e-4536-b5e6-052b48c90b52', '7', 2, 1, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('96d351fd-2d36-4bf3-a7c5-962c786a654e', '8', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('ced498bf-08c8-415a-bda5-596740371b01', '9', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('d6aa73fb-a68c-4fb5-8b85-677de136ad8a', '10', 8, 6, 'Privado', 'ROUND', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('269a5c4c-5f0c-4620-a517-9d3ef3ca86e3', '11', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('f4a54a19-f7ff-4d37-9f3c-9aa21863fe76', '12', 6, 4, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'de8b1efc-02b3-4184-a40e-9991956164ce', '2026-01-01 22:24:12.021', '2026-01-01 22:24:12.021');
INSERT INTO public."Table" VALUES ('7bd8fc43-f7f9-4a0c-890b-9ec798554a19', '1', 6, 4, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('6e83f8b0-ac90-4c16-97e7-dcf3ca964d10', '2', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('e10ecf1f-d8ff-4d84-81bf-ee715674c664', '3', 4, 2, 'Interior', 'ROUND', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('fa9b3d5e-7858-46df-ae8e-de05fdf42d6b', '4', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('f92ea98c-cf43-416b-b91d-acd66f19d676', '5', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('90c394c8-dd7f-4b85-b50e-b61676617415', '6', 2, 1, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('a883b1f9-153c-4305-856b-8179bd5434cb', '7', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('50d8b8e9-7b87-4f4c-8c38-2a6c6cdeb19e', '8', 2, 1, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('591d0138-7648-42d0-8989-05dda0d7193c', '9', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('687ea25a-4b29-43f6-9f8e-c5e378d529cb', '10', 2, 1, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('2c176625-d989-41c4-ade1-d87d090b8b26', '11', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('ed156a9d-2ea0-4458-b869-8cf2974f2280', '12', 2, 1, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('aeb80f5e-c168-4dc4-8714-c069885cb8c5', '13', 8, 6, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('3d49573d-f86e-45fb-82c3-56bd8cb790ae', '14', 8, 6, 'Interior', 'ROUND', true, NULL, NULL, 0, 'a839c8d2-2a02-40e2-920b-c43c9cda0394', '2026-01-01 22:24:12.045', '2026-01-01 22:24:12.045');
INSERT INTO public."Table" VALUES ('543b13f3-2296-48a6-9f85-8b2c42defbc9', '1', 6, 4, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('001db326-4913-4a82-b57d-b7fe62305eb0', '2', 6, 4, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('08f7a465-688c-49a6-844e-851afe018875', '3', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('de1b90f7-f6b4-4990-9128-c7e829e13b70', '4', 4, 2, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('8b69ad5a-30cb-4440-84a0-39ee1db0e8f1', '5', 8, 6, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('27bd1454-9dda-4a14-9632-984d8c4443bf', '6', 2, 1, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('80b7d6aa-5afb-40f1-90cd-34d70948c26c', '7', 2, 1, 'Privado', 'SQUARE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('36abf4be-10b1-41fc-828d-d5dad19aa2d1', '8', 4, 2, 'Salón', 'SQUARE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('c1d59fd6-27fb-4321-be0e-6fec03eb3e7a', '9', 6, 4, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('292972f8-43be-48eb-a028-d469c33fe6dd', '10', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'ccb963c9-0da1-4961-8e96-98a60d9c5747', '2026-01-01 22:24:12.061', '2026-01-01 22:24:12.061');
INSERT INTO public."Table" VALUES ('331389bd-ad4d-489e-9725-36a8204bfc20', '1', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('24f5bd8a-ad09-4269-b46c-097647c92bf1', '2', 6, 4, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('5b9a3d6d-1be1-4c20-84a6-39a6451baf74', '3', 8, 6, 'Privado', 'ROUND', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('abdbe6d4-74cd-41e9-9cd1-85f221fa17e7', '4', 8, 6, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('91a74c85-568b-45e1-9f9b-c9f1ad1162a8', '5', 8, 6, 'Salón', 'BOOTH', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('cc4a6117-0152-4645-9e1d-be5823e18720', '6', 6, 4, 'Salón', 'SQUARE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('3708802d-5c88-4b5b-9b2e-f9cb8ad6569f', '7', 6, 4, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('6e23ca12-9439-417f-8067-8c101616eb46', '8', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('9ea00b49-14c2-4321-922b-81c8c9b07f3c', '9', 6, 4, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('67c85dd4-6d64-4f58-8ef8-c155f8434c01', '10', 6, 4, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('b00fa287-16be-41cf-bd95-c472429413f9', '11', 6, 4, 'Barra', 'SQUARE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('fc0b802e-6cb5-4eed-b27a-51d7c422ce6a', '12', 4, 2, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('ed85f38c-0ec1-4ddb-b381-c92fe46d2efe', '13', 2, 1, 'Privado', 'ROUND', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('0e5bf2a6-94ee-4ed1-86d8-bf6d9dff97de', '14', 6, 4, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('5cfe0a52-1632-4862-85cc-f4f2309a1f73', '15', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, 'b74c8030-7571-417a-9b97-e82b80b500a6', '2026-01-01 22:24:12.081', '2026-01-01 22:24:12.081');
INSERT INTO public."Table" VALUES ('5bea3bd4-9395-4090-a921-7f0764dd3c11', '1', 6, 4, 'Privado', 'SQUARE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('cd728970-f32b-4583-93c2-b18aa7c880ea', '2', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('faaddc74-7eaf-4578-b7cb-413d0ad32125', '3', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('90622cf1-cca2-4e32-8f13-57cf419fe349', '4', 6, 4, 'Barra', 'ROUND', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('eb871361-5796-4e89-8b1e-ba480051dce0', '5', 2, 1, 'Salón', 'SQUARE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('5fd18119-be54-4ac7-be56-0546270bf9a1', '6', 2, 1, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('b73f785d-07fe-4e3c-b96b-a44fa97e7813', '7', 4, 2, 'Interior', 'BOOTH', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('4fcf88a4-86a3-4850-bb3c-e6317da7fb90', '8', 8, 6, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('71336291-373e-43c9-be3d-e302946e78c6', '9', 4, 2, 'Barra', 'SQUARE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('9825aa83-ca28-4144-b706-679fe11d610a', '10', 2, 1, 'Barra', 'BOOTH', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('a9900eb5-6ef3-41e5-a5f2-7c0fdb29e8b1', '11', 2, 1, 'Privado', 'SQUARE', true, NULL, NULL, 0, '777d3d7b-eeef-4855-82ff-34ed99b572e5', '2026-01-01 22:24:12.101', '2026-01-01 22:24:12.101');
INSERT INTO public."Table" VALUES ('3dc196c2-23a4-4d02-bfe6-5274176c6b91', '1', 6, 4, 'Terraza', 'ROUND', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('92170c27-580b-42fc-ab47-b9a6c4fa263a', '2', 6, 4, 'Salón', 'ROUND', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('6063d35e-89a4-47f2-aece-860fb28ca8c8', '3', 6, 4, 'Salón', 'ROUND', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('3a5d1300-1a22-490d-8604-f1719d8e9d0a', '4', 2, 1, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('c007306a-6d7c-4d19-929b-7dc5bfd80d58', '5', 2, 1, 'Interior', 'ROUND', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('9f96e76f-1450-4b2e-a3d4-a48de23aa7c2', '6', 8, 6, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('69392ef7-89a6-417a-8896-fc0bd8248620', '7', 2, 1, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('74eb42d1-4372-47c4-a0b1-3579be3e356a', '8', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'fcb7520f-ffde-4fc6-b870-5293b3813814', '2026-01-01 22:24:12.117', '2026-01-01 22:24:12.117');
INSERT INTO public."Table" VALUES ('05c0693c-1e9d-424f-82fb-c92b72beb7bc', '1', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('3e6b05ec-a377-4ce0-a1ed-9d3a440872fd', '2', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('433ab3de-b2d4-4665-b9e8-d2ec530ac70a', '3', 6, 4, 'Barra', 'SQUARE', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('71640588-e23f-410b-81dd-06bc2e1f8f5b', '4', 2, 1, 'Privado', 'SQUARE', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('97ba300f-01b3-42e4-84eb-87d92901d9e4', '5', 2, 1, 'Interior', 'RECTANGLE', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('5bca5e92-f2a1-4904-afec-deec2f36fe6f', '6', 4, 2, 'Salón', 'ROUND', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('922b5aec-15d2-4b66-9ef8-27874f1ff6f3', '7', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('18c37a76-2505-426d-9c55-3f7499643ecb', '8', 6, 4, 'Interior', 'ROUND', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('d7feece5-edc1-46d3-b873-a49ba138c42d', '9', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('3e364e43-930a-4bf0-a71e-f04eb2709851', '10', 8, 6, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '4691f3ea-941f-4a28-90a3-e5f02c42018c', '2026-01-01 22:24:12.14', '2026-01-01 22:24:12.14');
INSERT INTO public."Table" VALUES ('4b5b414e-559d-4152-a181-47a23316a1ad', '1', 4, 2, 'Salón', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('a96062c1-e9bf-4132-be7b-6909a1303255', '2', 2, 1, 'Salón', 'ROUND', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('731f679d-3191-42d2-abf8-dae8dbd74ef7', '3', 6, 4, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('555d13f1-9aa8-42d8-8568-51e6a6215b28', '4', 4, 2, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('101356e3-a909-4f22-ad84-5a49f79eff71', '5', 6, 4, 'Privado', 'ROUND', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('542aa510-b365-4616-9a93-3663121448f5', '6', 8, 6, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('1af98fa9-7461-45fd-a65d-3428109f72d0', '7', 4, 2, 'Terraza', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('95cd2dff-d1d3-4f8e-a4ac-2da7fe15f23e', '8', 4, 2, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('35d33bbb-f4f4-4bf7-9d5f-cd16ceab9d52', '9', 2, 1, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('22d2d96d-6c10-4443-a19b-06a08a5c80ef', '10', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('0b1041f8-a880-405a-ba86-1ade6524f0a9', '11', 2, 1, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('d8793eb1-c323-4ccf-be9b-fbfe7fa00516', '12', 8, 6, 'Barra', 'RECTANGLE', true, NULL, NULL, 0, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '2026-01-01 22:24:12.162', '2026-01-01 22:24:12.162');
INSERT INTO public."Table" VALUES ('5b1fa91d-d653-473c-9be7-2cdc05ecc56c', '1', 4, 2, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('6f252668-41e7-4aef-8204-6d7bfebd64d9', '2', 4, 2, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('294d48c1-3c9e-408b-8dc4-c236e00ffb92', '3', 8, 6, 'Privado', 'ROUND', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('92e300ca-2765-4125-88e3-9974dcd8c431', '4', 8, 6, 'Salón', 'ROUND', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('9d4456bb-fca1-4185-b8ff-7ce3b4fb4300', '5', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('1b7ed94e-5e21-4beb-b5f8-6097726dc10e', '6', 4, 2, 'Interior', 'SQUARE', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('4b17464f-f192-4c58-a3ed-ad81b90e37ff', '7', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('fd655450-fb8f-4aa6-9a54-840e65e6a114', '8', 2, 1, 'Barra', 'BOOTH', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('86d4dc65-1b44-4fee-8526-8a0a91b1bb75', '9', 6, 4, 'Interior', 'BOOTH', true, NULL, NULL, 0, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '2026-01-01 22:24:12.184', '2026-01-01 22:24:12.184');
INSERT INTO public."Table" VALUES ('a68d7d8b-6c1b-49a3-8d8f-b6fa51ea5dcd', '1', 4, 2, 'Privado', 'ROUND', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('168b43f0-ac05-45db-9b43-546c82da27c7', '2', 6, 4, 'Terraza', 'ROUND', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('3e67fb96-d55a-413c-9627-3792571ca82a', '3', 8, 6, 'Terraza', 'ROUND', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('d1f019cc-128f-461e-99b7-ce0ebbdc359e', '4', 6, 4, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('0206f936-c093-4bda-b4b9-a19ff562785d', '5', 2, 1, 'Barra', 'BOOTH', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('cb8ab925-7a90-4160-98bb-b56d846d33e1', '6', 6, 4, 'Privado', 'ROUND', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('00ce1475-afef-419f-ab64-3bf737817867', '7', 8, 6, 'Terraza', 'SQUARE', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('2675921e-6405-479c-9aa4-f4bef93dfc7f', '8', 2, 1, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('15b32c89-9770-442c-b536-10318e1025b5', '9', 4, 2, 'Terraza', 'BOOTH', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('94294e16-0150-4f8f-95ca-41cc684eae23', '10', 4, 2, 'Privado', 'BOOTH', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('303f44c9-97c0-46bf-8717-1353899351d4', '11', 8, 6, 'Privado', 'RECTANGLE', true, NULL, NULL, 0, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2026-01-01 22:24:12.209', '2026-01-01 22:24:12.209');
INSERT INTO public."Table" VALUES ('bffbae8d-1001-47c3-934d-7942b71bd79f', '19', 4, 1, 'Jardín', 'ROUND', true, NULL, NULL, 0, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-03 04:58:33.022', '2026-01-03 04:58:33.022');


--
-- Data for Name: Booking; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Booking" VALUES ('baf459c3-053d-4447-993c-0625804b62a6', '2026-01-02 00:00:00', '12:30', 2, '', 'jose mas', 'josemas68@gmail.com', '666666666', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 12:19:29.869', '2026-01-01 19:24:38.183', NULL);
INSERT INTO public."Booking" VALUES ('00b09a24-2697-402a-b731-eb729848a6c1', '2026-01-14 00:00:00', '13:00', 3, '', 'jose mas', 'josemas68@gmail.com', '685951848', 'COMPLETED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:00:14.955', '2026-01-01 19:25:17.317', '0cd0212e-d4f1-4283-bf27-f4427dde3151');
INSERT INTO public."Booking" VALUES ('4c80bf09-8ae8-48a6-8ac0-6e838d69aabc', '2026-01-02 00:00:00', '21:30', 4, '', 'juni', 'josemas68@gmail.com', '699999990', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:30:09.451', '2026-01-01 19:30:09.451', NULL);
INSERT INTO public."Booking" VALUES ('75fc7c5a-e11b-4ea4-9926-7500f56bfbac', '2026-01-02 00:00:00', '21:30', 4, '', 'adrian', 'josemas68@gmail.com', '6859518888', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:30:35.707', '2026-01-01 19:30:35.707', NULL);
INSERT INTO public."Booking" VALUES ('b9f847e3-b75f-4551-9272-76ae18b3d526', '2026-01-09 22:25:03.386', '12:30', 8, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1237252045', 'CONFIRMED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:03.405', '2026-01-01 22:25:03.405', 'ac8956b8-1e45-41d0-b633-40b124a23143');
INSERT INTO public."Booking" VALUES ('665f6158-581b-419b-a467-f956ef78685b', '2026-01-01 22:25:03.386', '19:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 963039893', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:03.452', '2026-01-01 22:25:03.452', '89513e7f-4779-4166-89a6-c308200ce7e3');
INSERT INTO public."Booking" VALUES ('63ee122a-053a-42b5-8760-a4006531ebdf', '2026-01-28 22:25:03.386', '13:30', 8, 'Alergia a los frutos secos', 'Miguel Invitado', 'invitado2@example.com', '+34 741354938', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.775', '2026-01-01 22:25:04.775', '89fa79b5-159b-4767-a295-eba10c0db8fc');
INSERT INTO public."Booking" VALUES ('4283d49d-2179-4173-89cd-3b12111b9c8f', '2026-01-01 22:25:03.386', '12:00', 2, NULL, 'David Invitado', 'invitado3@example.com', '+34 1195559484', 'CONFIRMED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.802', '2026-01-01 22:25:04.802', '399a9e1e-2500-4a0b-ba5b-b4703cdd3f37');
INSERT INTO public."Booking" VALUES ('33937cdd-f7c8-409e-816c-078d795c125f', '2025-12-02 22:25:03.386', '13:30', 4, 'Preferimos zona tranquila', 'Ana Martínez', 'ana.martinez@example.com', '+34 1293014037', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:04.835', '2026-01-01 22:25:04.835', '032a391e-0f7d-401f-84fc-0a8192ae6b2a');
INSERT INTO public."Booking" VALUES ('71bfcbf6-e715-4f9a-b6d5-8577b44676bc', '2026-01-05 22:25:03.386', '18:00', 4, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1096750891', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:04.844', '2026-01-01 22:25:04.844', '119c9f6b-c20b-479f-a157-3e9a76e6570b');
INSERT INTO public."Booking" VALUES ('59a8a5bd-566c-4ff8-8579-0674a421bacc', '2025-12-23 22:25:03.386', '17:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1210738542', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:04.86', '2026-01-01 22:25:04.86', '66bbd22c-ac5e-4f84-914a-4b408a95613f');
INSERT INTO public."Booking" VALUES ('fa9a3ef4-2032-4e40-b82c-452aefc75cbd', '2025-12-24 22:25:03.386', '19:00', 6, 'Alergia a los frutos secos', 'Miguel Invitado', 'invitado7@example.com', '+34 917505691', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.868', '2026-01-01 22:25:04.868', '89fa79b5-159b-4767-a295-eba10c0db8fc');
INSERT INTO public."Booking" VALUES ('40b512a9-f121-4629-bb6b-2e5d7f122d8a', '2026-01-11 22:25:03.386', '20:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 977642707', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:04.875', '2026-01-01 22:25:04.875', '66bbd22c-ac5e-4f84-914a-4b408a95613f');
INSERT INTO public."Booking" VALUES ('a7006325-237d-4672-bd11-bddccc9a3085', '2026-01-14 22:25:03.386', '16:30', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 641243880', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:04.883', '2026-01-01 22:25:04.883', '399a9e1e-2500-4a0b-ba5b-b4703cdd3f37');
INSERT INTO public."Booking" VALUES ('03f08fb3-f3c8-4c4f-9a7a-bab5833b51f6', '2025-12-07 22:25:03.386', '14:00', 6, NULL, 'David Invitado', 'invitado10@example.com', '+34 762566977', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.891', '2026-01-01 22:25:04.891', '0649b1ae-3621-49cc-93c1-871f517d904b');
INSERT INTO public."Booking" VALUES ('02ba785a-261a-4814-9a30-7972158ace56', '2025-12-14 22:25:03.386', '21:00', 2, NULL, 'Javier Invitado', 'invitado11@example.com', '+34 911881978', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.899', '2026-01-01 22:25:04.899', '399a9e1e-2500-4a0b-ba5b-b4703cdd3f37');
INSERT INTO public."Booking" VALUES ('91a1c906-29a0-44f7-9dc8-dc7dc9a3b941', '2026-01-02 22:25:03.386', '17:00', 4, NULL, 'Laura Invitado', 'invitado12@example.com', '+34 750600751', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.906', '2026-01-01 22:25:04.906', '0649b1ae-3621-49cc-93c1-871f517d904b');
INSERT INTO public."Booking" VALUES ('ad87a02c-1a35-471a-9042-a1bb7f12daa5', '2025-12-29 22:25:03.386', '13:00', 4, 'Mesa cerca de la ventana por favor', 'María Invitado', 'invitado13@example.com', '+34 1349455265', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-01 22:25:04.92', '2026-01-01 22:25:04.92', '71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b');
INSERT INTO public."Booking" VALUES ('d6b28392-a2bd-46ea-bce1-3724cf6934b8', '2025-12-12 22:25:03.386', '13:00', 2, NULL, 'Miguel Invitado', 'invitado0@example.com', '+34 1420060312', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:04.973', '2026-01-01 22:25:04.973', '15b32c89-9770-442c-b536-10318e1025b5');
INSERT INTO public."Booking" VALUES ('23febd6e-eb75-4831-a4de-b06e54e0b5ec', '2025-12-10 22:25:03.386', '20:30', 2, NULL, 'Carmen Invitado', 'invitado1@example.com', '+34 1391123266', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.013', '2026-01-01 22:25:05.013', '0206f936-c093-4bda-b4b9-a19ff562785d');
INSERT INTO public."Booking" VALUES ('f8d2794d-b54a-4a99-9d50-bed8d75a9585', '2026-01-14 22:25:03.386', '18:30', 4, 'Mesa cerca de la ventana por favor', 'Laura Fernández', 'laura.fernandez@example.com', '+34 956391962', 'PENDING', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:05.034', '2026-01-01 22:25:05.034', '168b43f0-ac05-45db-9b43-546c82da27c7');
INSERT INTO public."Booking" VALUES ('ea92dfcb-4181-487d-97b3-492297ab2d7c', '2026-01-29 22:25:03.386', '21:00', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 805316711', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:05.053', '2026-01-01 22:25:05.053', 'a68d7d8b-6c1b-49a3-8d8f-b6fa51ea5dcd');
INSERT INTO public."Booking" VALUES ('e63bd848-0303-42bb-8adc-15404b414cd3', '2025-12-20 22:25:03.386', '13:30', 4, 'Silla de bebé necesaria', 'Ana Invitado', 'invitado4@example.com', '+34 1264602550', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.082', '2026-01-01 22:25:05.082', 'cb8ab925-7a90-4160-98bb-b56d846d33e1');
INSERT INTO public."Booking" VALUES ('9ae25fa3-220b-4514-96b0-a8b2c8201b16', '2026-01-02 00:00:00', '21:30', 2, '', 'jose mas', 'josemas68@gmail.com', '+34685951848', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:14:28.426', '2026-01-02 18:32:15.678', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('bcf95931-f5c1-42a9-98d8-2842552e65d1', '2026-01-02 00:00:00', '21:30', 2, '', 'juan oli', 'josemas68aa@gmail.com', '611111111', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:29:31.237', '2026-01-02 21:03:02.798', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('a1dc1131-0325-4083-af2d-558b178641b9', '2026-01-02 00:00:00', '21:30', 10, '', 'adrian vals', 'josemas6ddd8@gmail.com', '685951888', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:31:32.236', '2026-01-02 21:03:41.793', 'b0ed2b4b-d7f5-40cc-ab65-dd8589baae3f');
INSERT INTO public."Booking" VALUES ('9561812b-17cb-41d1-9858-6ceb9530def1', '2026-01-02 00:00:00', '21:30', 4, '', 'jose mas', 'josemas68@gmail.com', '695999881', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-01 19:30:56.539', '2026-01-02 21:04:26.857', '0cd0212e-d4f1-4283-bf27-f4427dde3151');
INSERT INTO public."Booking" VALUES ('4a209843-4119-4038-9d32-78cc0cd5d181', '2025-12-21 22:25:03.386', '19:00', 4, 'Cumpleaños, ¿tienen tarta?', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1427437713', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:05.116', '2026-01-01 22:25:05.116', '94294e16-0150-4f8f-95ca-41cc684eae23');
INSERT INTO public."Booking" VALUES ('be095126-19a7-48d5-8d35-ea6f35678836', '2026-01-06 22:25:03.386', '15:00', 4, NULL, 'Javier Invitado', 'invitado6@example.com', '+34 1066195636', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.166', '2026-01-01 22:25:05.166', '15b32c89-9770-442c-b536-10318e1025b5');
INSERT INTO public."Booking" VALUES ('159179f1-78a2-401e-8909-3a339942fc0a', '2026-01-23 22:25:03.386', '20:00', 8, 'Silla de bebé necesaria', 'Laura Fernández', 'laura.fernandez@example.com', '+34 686444571', 'PENDING', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:05.18', '2026-01-01 22:25:05.18', '303f44c9-97c0-46bf-8717-1353899351d4');
INSERT INTO public."Booking" VALUES ('ee452e12-ec92-4bd3-87a9-c9e8b399453d', '2025-12-10 22:25:03.386', '15:30', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 746823199', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:05.189', '2026-01-01 22:25:05.189', '0206f936-c093-4bda-b4b9-a19ff562785d');
INSERT INTO public."Booking" VALUES ('e058b477-eb4b-4ff9-8916-05a1afcaedf5', '2026-01-26 22:25:03.386', '14:00', 4, NULL, 'David Invitado', 'invitado9@example.com', '+34 1442298813', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.201', '2026-01-01 22:25:05.201', '15b32c89-9770-442c-b536-10318e1025b5');
INSERT INTO public."Booking" VALUES ('60b51fc7-5769-4782-b046-807fcb637dfc', '2025-12-21 22:25:03.386', '21:30', 2, NULL, 'Ana Invitado', 'invitado10@example.com', '+34 650654987', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.232', '2026-01-01 22:25:05.232', 'a68d7d8b-6c1b-49a3-8d8f-b6fa51ea5dcd');
INSERT INTO public."Booking" VALUES ('922b3c68-2e8c-4e8d-b6f8-c3ae61fbc05c', '2026-01-23 22:25:03.386', '14:00', 4, NULL, 'Carmen Invitado', 'invitado11@example.com', '+34 1445289866', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-01 22:25:05.274', '2026-01-01 22:25:05.274', '15b32c89-9770-442c-b536-10318e1025b5');
INSERT INTO public."Booking" VALUES ('de1853b4-fc0d-48f6-ac8b-51300b261e9a', '2025-12-12 22:25:03.386', '19:30', 6, 'Alergia a los frutos secos', 'Ana Invitado', 'invitado0@example.com', '+34 892691068', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:05.333', '2026-01-01 22:25:05.333', 'ac3fae8e-defd-4458-963f-5dd252a4d0ba');
INSERT INTO public."Booking" VALUES ('aea5b092-0be2-4c00-8b0e-003ec092f1f8', '2026-01-28 22:25:03.386', '14:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1060215926', 'PENDING', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:05.353', '2026-01-01 22:25:05.353', '757f1f6d-3400-4eb4-84dd-adafa24075da');
INSERT INTO public."Booking" VALUES ('23ba59c8-390f-4250-b0b4-41b0e1ff80ce', '2025-12-17 22:25:03.386', '16:30', 2, NULL, 'Ana Invitado', 'invitado2@example.com', '+34 1422282834', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:05.387', '2026-01-01 22:25:05.387', '757f1f6d-3400-4eb4-84dd-adafa24075da');
INSERT INTO public."Booking" VALUES ('21e3ddbf-06c2-4256-9b4a-3bf79c8d1a88', '2025-12-28 22:25:03.386', '19:30', 4, 'Alergia a los frutos secos', 'Ana Invitado', 'invitado3@example.com', '+34 1418232673', 'CANCELLED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:05.729', '2026-01-01 22:25:05.729', 'ac3fae8e-defd-4458-963f-5dd252a4d0ba');
INSERT INTO public."Booking" VALUES ('81a41f4b-66bc-4367-9d7d-2051448096d6', '2025-12-23 22:25:03.386', '12:00', 2, 'Preferimos zona tranquila', 'Carmen Pérez', 'carmen.perez@example.com', '+34 855598675', 'CANCELLED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:05.843', '2026-01-01 22:25:05.843', 'f786c3d7-ffc5-41ff-aff9-2734474e565b');
INSERT INTO public."Booking" VALUES ('2ec8ed95-5f80-4591-b12c-f25052569222', '2026-01-01 22:25:03.386', '19:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1309439721', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:05.94', '2026-01-01 22:25:05.94', '2289e983-b4a8-4516-a620-a2ec517e3f6b');
INSERT INTO public."Booking" VALUES ('1af923af-6644-40c7-bc62-3fcf931b55a1', '2025-12-22 22:25:03.386', '19:00', 2, 'Silla de bebé necesaria', 'María Invitado', 'invitado6@example.com', '+34 1190268534', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:05.977', '2026-01-01 22:25:05.977', 'f786c3d7-ffc5-41ff-aff9-2734474e565b');
INSERT INTO public."Booking" VALUES ('4d6778a4-17fd-4b8b-8dda-668c8a78491a', '2025-12-17 22:25:03.386', '12:30', 4, NULL, 'Carlos Invitado', 'invitado7@example.com', '+34 1239770637', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:06.019', '2026-01-01 22:25:06.019', '2289e983-b4a8-4516-a620-a2ec517e3f6b');
INSERT INTO public."Booking" VALUES ('a6547f9c-1832-4fee-9bad-0e7f444b82c7', '2026-01-29 22:25:03.386', '13:30', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1085390605', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:06.06', '2026-01-01 22:25:06.06', '148359bc-6078-412a-abe3-c6c96d35d61d');
INSERT INTO public."Booking" VALUES ('b949a19f-debb-4ad4-a0e1-340007b8cfba', '2026-01-19 22:25:03.386', '14:00', 4, NULL, 'Carmen Invitado', 'invitado9@example.com', '+34 803369862', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:06.096', '2026-01-01 22:25:06.096', 'cf70734a-32a0-4da0-90a0-e276155b98c4');
INSERT INTO public."Booking" VALUES ('a5dff88d-a208-4739-9b46-e705f1cb9f9b', '2025-12-29 22:25:03.386', '14:30', 8, 'Silla de bebé necesaria', 'María Invitado', 'invitado10@example.com', '+34 887608167', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:06.176', '2026-01-01 22:25:06.176', '23674bbd-2633-4dcc-ade2-11bef18e0fa7');
INSERT INTO public."Booking" VALUES ('962428b7-442a-49a0-968d-31b426316c45', '2025-12-09 22:25:03.386', '15:00', 4, NULL, 'Laura Invitado', 'invitado11@example.com', '+34 683047968', 'CANCELLED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:06.233', '2026-01-01 22:25:06.233', '757f1f6d-3400-4eb4-84dd-adafa24075da');
INSERT INTO public."Booking" VALUES ('1e3761e3-5c91-41fe-9e41-678fa43fa698', '2026-01-16 22:25:03.386', '14:00', 4, NULL, 'Javier Invitado', 'invitado12@example.com', '+34 750137096', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-01 22:25:06.277', '2026-01-01 22:25:06.277', 'ac3fae8e-defd-4458-963f-5dd252a4d0ba');
INSERT INTO public."Booking" VALUES ('fc2e2da7-ad85-42f2-98e3-506977e42ab6', '2026-01-01 22:25:03.386', '17:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1400567992', 'PENDING', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:06.379', '2026-01-01 22:25:06.379', 'f92ea98c-cf43-416b-b91d-acd66f19d676');
INSERT INTO public."Booking" VALUES ('c7c9e81d-0211-4d0c-9916-3035d01d19be', '2025-12-12 22:25:03.386', '15:30', 4, NULL, 'Ana Invitado', 'invitado1@example.com', '+34 953661630', 'COMPLETED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', NULL, '2026-01-01 22:25:06.438', '2026-01-01 22:25:06.438', '6e83f8b0-ac90-4c16-97e7-dcf3ca964d10');
INSERT INTO public."Booking" VALUES ('10153199-4be1-4847-846c-e0be84ea6ebe', '2026-01-17 22:25:03.386', '21:00', 6, 'Silla de bebé necesaria', 'Ana Invitado', 'invitado2@example.com', '+34 1249780622', 'CONFIRMED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', NULL, '2026-01-01 22:25:06.536', '2026-01-01 22:25:06.536', '591d0138-7648-42d0-8989-05dda0d7193c');
INSERT INTO public."Booking" VALUES ('09c7e8af-7f27-4460-95a4-4423549ba594', '2025-12-31 22:25:03.386', '20:30', 2, NULL, 'David Invitado', 'invitado3@example.com', '+34 696072679', 'CONFIRMED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', NULL, '2026-01-01 22:25:06.629', '2026-01-01 22:25:06.629', 'e10ecf1f-d8ff-4d84-81bf-ee715674c664');
INSERT INTO public."Booking" VALUES ('645c91c7-0468-477e-8ff8-a543c0277ad0', '2025-12-20 22:25:03.386', '15:30', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1203486760', 'COMPLETED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:06.703', '2026-01-01 22:25:06.703', '7bd8fc43-f7f9-4a0c-890b-9ec798554a19');
INSERT INTO public."Booking" VALUES ('0d976ff0-dd7e-4d5f-8c80-d8918ad5e8bb', '2026-01-23 22:25:03.386', '20:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 948237812', 'CONFIRMED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:06.91', '2026-01-01 22:25:06.91', '6e83f8b0-ac90-4c16-97e7-dcf3ca964d10');
INSERT INTO public."Booking" VALUES ('47ca794d-fcce-4ea0-bae1-9d74265539dd', '2026-01-13 22:25:03.386', '17:00', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 740352677', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:06.923', '2026-01-01 22:25:06.923', '3e41b965-557f-4d5b-bc32-ec5a1c06582a');
INSERT INTO public."Booking" VALUES ('4b249e35-eb6b-4b31-b8f9-7f2c22f84cea', '2026-01-26 22:25:03.386', '20:00', 2, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 894172761', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:06.933', '2026-01-01 22:25:06.933', '5d4aa0ee-0ae0-4cc3-812b-09f9f865b98d');
INSERT INTO public."Booking" VALUES ('b16cb971-1a3c-46c1-bcea-a864f8f46302', '2026-01-02 22:25:03.386', '18:00', 2, NULL, 'Ana Invitado', 'invitado2@example.com', '+34 1026986746', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-01 22:25:06.942', '2026-01-01 22:25:06.942', '2b129dae-0f26-4ba8-813f-b5ba5c17b1f9');
INSERT INTO public."Booking" VALUES ('6e435e1c-8b9b-4429-b71c-71139e6e8a8b', '2025-12-17 22:25:03.386', '14:30', 4, NULL, 'María Invitado', 'invitado4@example.com', '+34 696170846', 'COMPLETED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-01 22:25:06.996', '2026-01-01 22:25:06.996', 'ee2996f6-0295-498b-882b-ac4983d83afe');
INSERT INTO public."Booking" VALUES ('b28a2081-aba3-4366-a0cd-98f88e99a258', '2026-01-19 22:25:03.386', '17:30', 2, 'Silla de bebé necesaria', 'Carlos López', 'carlos.lopez@example.com', '+34 1477260633', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:07.009', '2026-01-01 22:25:07.009', '3e41b965-557f-4d5b-bc32-ec5a1c06582a');
INSERT INTO public."Booking" VALUES ('7a9c8111-59f9-450e-97cc-27a13d7c757b', '2025-12-26 22:25:03.386', '12:30', 6, 'Cumpleaños, ¿tienen tarta?', 'Ana Invitado', 'invitado6@example.com', '+34 701363095', 'CANCELLED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-01 22:25:07.025', '2026-01-01 22:25:07.025', 'ee2996f6-0295-498b-882b-ac4983d83afe');
INSERT INTO public."Booking" VALUES ('919b5842-763d-41da-b431-d29d9cf7e70d', '2026-01-28 22:25:03.386', '17:30', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 653951133', 'PENDING', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:07.125', '2026-01-01 22:25:07.125', 'dc1b286a-fa0d-4037-8ccb-6eea1451768c');
INSERT INTO public."Booking" VALUES ('4654578a-bff9-4d34-84ca-da81cd243ace', '2025-12-06 22:25:03.386', '21:00', 6, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 973011306', 'CANCELLED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-01 22:25:07.149', '2026-01-01 22:25:07.149', '1df35ef6-f148-4089-b6ee-e5288a84aa15');
INSERT INTO public."Booking" VALUES ('7073d47f-e20d-4e7a-86c4-adca3328aa06', '2026-01-09 22:25:03.386', '13:30', 4, 'Silla de bebé necesaria', 'Carlos López', 'carlos.lopez@example.com', '+34 1068638101', 'PENDING', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:07.2', '2026-01-01 22:25:07.2', '3e41b965-557f-4d5b-bc32-ec5a1c06582a');
INSERT INTO public."Booking" VALUES ('f9b030b7-c16c-469b-a616-b1908739b7fe', '2026-01-12 22:25:03.386', '16:00', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1188384931', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:07.261', '2026-01-01 22:25:07.261', '5fb3ba3c-7a63-4ae0-be62-fd7003fa10f9');
INSERT INTO public."Booking" VALUES ('8cf1fba1-36da-4c25-8b04-fc9dbfdf791b', '2026-01-08 22:25:03.386', '20:00', 8, 'Alergia a los frutos secos', 'David Rodríguez', 'david.rodriguez@example.com', '+34 767216034', 'PENDING', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:07.327', '2026-01-01 22:25:07.327', 'a0953bd5-b199-49c6-b37c-66adc43339bf');
INSERT INTO public."Booking" VALUES ('cdffbad9-23d3-484a-b4f2-fe321b150ec2', '2026-01-11 22:25:03.386', '20:30', 6, NULL, 'David Invitado', 'invitado2@example.com', '+34 758469031', 'PENDING', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', NULL, '2026-01-01 22:25:07.362', '2026-01-01 22:25:07.362', 'a0953bd5-b199-49c6-b37c-66adc43339bf');
INSERT INTO public."Booking" VALUES ('2a53a7bf-5013-4d80-a05e-e90c82d79ef1', '2025-12-20 22:25:03.386', '16:00', 2, NULL, 'Carlos Invitado', 'invitado3@example.com', '+34 1463860916', 'COMPLETED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', NULL, '2026-01-01 22:25:07.41', '2026-01-01 22:25:07.41', '5f5902ca-c0f7-46d2-9b0b-1a87277b5cfe');
INSERT INTO public."Booking" VALUES ('5ae716ad-9ae7-4c7b-985c-6ff11bfc968f', '2025-12-30 22:25:03.386', '14:30', 4, 'Cumpleaños, ¿tienen tarta?', 'Miguel Gómez', 'miguel.gomez@example.com', '+34 746108874', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:07.451', '2026-01-01 22:25:07.451', '19531aa8-7f3c-4391-a88d-4158f5382914');
INSERT INTO public."Booking" VALUES ('0f517b1c-6fc0-4a13-9c1b-10e52fb478f8', '2025-12-06 22:25:03.386', '16:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1316944604', 'COMPLETED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:07.488', '2026-01-01 22:25:07.488', '3f7a9251-2d3f-4ead-8650-0aea0e10cd37');
INSERT INTO public."Booking" VALUES ('4fc36203-f71f-4b5a-8bc1-e7d5b13fb16c', '2026-01-23 22:25:03.386', '17:00', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1198079567', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:07.542', '2026-01-01 22:25:07.542', '19531aa8-7f3c-4391-a88d-4158f5382914');
INSERT INTO public."Booking" VALUES ('d33ad618-964f-42b1-adb9-6f117feedc31', '2026-01-05 22:25:03.386', '17:00', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 659838130', 'CONFIRMED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:07.783', '2026-01-01 22:25:07.783', 'c007306a-6d7c-4d19-929b-7dc5bfd80d58');
INSERT INTO public."Booking" VALUES ('a7d39c5c-0acf-4413-9787-3d7d5ef1c1b1', '2025-12-29 22:25:03.386', '19:30', 2, 'Alergia a los frutos secos', 'David Rodríguez', 'david.rodriguez@example.com', '+34 988028801', 'COMPLETED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:07.936', '2026-01-01 22:25:07.936', '3a5d1300-1a22-490d-8604-f1719d8e9d0a');
INSERT INTO public."Booking" VALUES ('77a2184d-2eea-4d10-970c-3e4325711782', '2025-12-18 22:25:03.386', '15:30', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1084431422', 'CANCELLED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:07.993', '2026-01-01 22:25:07.993', '74eb42d1-4372-47c4-a0b1-3579be3e356a');
INSERT INTO public."Booking" VALUES ('8311a0d4-f7c9-48fd-b89d-9eed0a1000eb', '2026-01-08 22:25:03.386', '21:00', 4, 'Preferimos zona tranquila', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 654961875', 'CONFIRMED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:08.022', '2026-01-01 22:25:08.022', '3dc196c2-23a4-4d02-bfe6-5274176c6b91');
INSERT INTO public."Booking" VALUES ('6a03c080-5698-429f-be18-16fc6be38ea0', '2026-01-02 22:25:03.386', '20:30', 4, NULL, 'David Invitado', 'invitado4@example.com', '+34 725995297', 'PENDING', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-01 22:25:08.039', '2026-01-01 22:25:08.039', '6063d35e-89a4-47f2-aece-860fb28ca8c8');
INSERT INTO public."Booking" VALUES ('ef48764d-4caa-41d6-81bd-e37ed8701254', '2025-12-04 22:25:03.386', '13:30', 6, NULL, 'Carmen Invitado', 'invitado5@example.com', '+34 699200684', 'COMPLETED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-01 22:25:08.083', '2026-01-01 22:25:08.083', '92170c27-580b-42fc-ab47-b9a6c4fa263a');
INSERT INTO public."Booking" VALUES ('85d0ba9f-5f41-4c25-b26d-76b138e6ceee', '2026-01-26 22:25:03.386', '14:30', 8, 'Cumpleaños, ¿tienen tarta?', 'Miguel Invitado', 'invitado6@example.com', '+34 647352423', 'CONFIRMED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-01 22:25:08.133', '2026-01-01 22:25:08.133', '9f96e76f-1450-4b2e-a3d4-a48de23aa7c2');
INSERT INTO public."Booking" VALUES ('78aa2b3f-2ab0-4441-bd9a-affbf84ae4fe', '2026-01-19 22:25:03.386', '21:30', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1026744748', 'CONFIRMED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:08.196', '2026-01-01 22:25:08.196', 'a96062c1-e9bf-4132-be7b-6909a1303255');
INSERT INTO public."Booking" VALUES ('0e7b32d0-1eae-4dd7-8436-b1b7a3d5c2c2', '2026-01-16 22:25:03.386', '20:00', 2, NULL, 'Javier Invitado', 'invitado1@example.com', '+34 1099688584', 'PENDING', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-01 22:25:08.332', '2026-01-01 22:25:08.332', 'a96062c1-e9bf-4132-be7b-6909a1303255');
INSERT INTO public."Booking" VALUES ('22a7725d-1380-4734-add6-416fbcb60129', '2026-01-10 22:25:03.386', '21:30', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 773263250', 'PENDING', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:08.363', '2026-01-01 22:25:08.363', '731f679d-3191-42d2-abf8-dae8dbd74ef7');
INSERT INTO public."Booking" VALUES ('13ff3cc7-3c84-4348-ba45-473a09ff154c', '2026-01-02 22:25:03.386', '15:30', 4, NULL, 'Carmen Invitado', 'invitado3@example.com', '+34 804838694', 'CONFIRMED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-01 22:25:08.443', '2026-01-01 22:25:08.443', '101356e3-a909-4f22-ad84-5a49f79eff71');
INSERT INTO public."Booking" VALUES ('1c8cf16d-8c05-46c5-b60c-80b879a112bc', '2025-12-04 22:25:03.386', '13:00', 2, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1091225862', 'COMPLETED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:08.558', '2026-01-01 22:25:08.558', '0b1041f8-a880-405a-ba86-1ade6524f0a9');
INSERT INTO public."Booking" VALUES ('31abd231-b423-40c1-8680-3b137150bf70', '2025-12-24 22:25:03.386', '17:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 911675260', 'CANCELLED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:08.632', '2026-01-01 22:25:08.632', '731f679d-3191-42d2-abf8-dae8dbd74ef7');
INSERT INTO public."Booking" VALUES ('d20220b3-cc24-4a66-a71b-f5262302eb82', '2025-12-17 22:25:03.386', '17:00', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 947532114', 'CANCELLED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:08.687', '2026-01-01 22:25:08.687', '731f679d-3191-42d2-abf8-dae8dbd74ef7');
INSERT INTO public."Booking" VALUES ('fc3e2734-a60a-4019-87ed-9daa29835cd9', '2026-01-20 22:25:03.386', '14:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1122562579', 'PENDING', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:08.887', '2026-01-01 22:25:08.887', '555d13f1-9aa8-42d8-8568-51e6a6215b28');
INSERT INTO public."Booking" VALUES ('61540fd3-e5e6-4319-8ec3-88e34d1271f9', '2025-12-16 22:25:03.386', '21:30', 8, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 970618233', 'CANCELLED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-01 22:25:08.989', '2026-01-01 22:25:08.989', 'd8793eb1-c323-4ccf-be9b-fbfe7fa00516');
INSERT INTO public."Booking" VALUES ('f9cb2ff4-4ca1-4190-9187-ee75d38265ce', '2026-01-06 22:25:03.386', '15:30', 4, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1000159599', 'CONFIRMED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:09.043', '2026-01-01 22:25:09.043', '555d13f1-9aa8-42d8-8568-51e6a6215b28');
INSERT INTO public."Booking" VALUES ('5765f796-d6df-420b-89b3-48607852fe86', '2026-01-05 22:25:03.386', '13:00', 8, 'Alergia a los frutos secos', 'Carmen Pérez', 'carmen.perez@example.com', '+34 958885785', 'PENDING', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:09.055', '2026-01-01 22:25:09.055', '542aa510-b365-4616-9a93-3663121448f5');
INSERT INTO public."Booking" VALUES ('a08df547-bf3d-4e00-877c-0eb1e8159d9a', '2025-12-10 22:25:03.386', '21:30', 2, 'Alergia a los frutos secos', 'Carmen Invitado', 'invitado0@example.com', '+34 863524832', 'COMPLETED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.07', '2026-01-01 22:25:09.07', '292972f8-43be-48eb-a028-d469c33fe6dd');
INSERT INTO public."Booking" VALUES ('91ae5045-2930-4c87-9f89-a6e267ec0d8c', '2025-12-15 22:25:03.386', '21:30', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1291266729', 'COMPLETED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:09.086', '2026-01-01 22:25:09.086', '36abf4be-10b1-41fc-828d-d5dad19aa2d1');
INSERT INTO public."Booking" VALUES ('6252ab02-a16d-4c0e-82cf-0fda58190546', '2026-01-26 22:25:03.386', '16:00', 6, NULL, 'Javier Invitado', 'invitado2@example.com', '+34 1138272274', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.096', '2026-01-01 22:25:09.096', '8b69ad5a-30cb-4440-84a0-39ee1db0e8f1');
INSERT INTO public."Booking" VALUES ('4a1afb14-aa3a-43c8-8c38-1583805f3501', '2025-12-06 22:25:03.386', '13:00', 2, NULL, 'María Invitado', 'invitado3@example.com', '+34 1426766622', 'COMPLETED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.11', '2026-01-01 22:25:09.11', '80b7d6aa-5afb-40f1-90cd-34d70948c26c');
INSERT INTO public."Booking" VALUES ('af002ac8-a949-4fa3-a2ae-272efe498d33', '2026-01-30 22:25:03.386', '15:30', 6, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 964053451', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:09.129', '2026-01-01 22:25:09.129', '543b13f3-2296-48a6-9f85-8b2c42defbc9');
INSERT INTO public."Booking" VALUES ('f9c5e27d-203a-4709-940e-c98590d266b6', '2026-01-30 22:25:03.386', '13:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 926231059', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:09.138', '2026-01-01 22:25:09.138', '27bd1454-9dda-4a14-9632-984d8c4443bf');
INSERT INTO public."Booking" VALUES ('ad36880a-34cc-4340-bebe-b438753813c1', '2026-01-29 22:25:03.386', '12:30', 4, 'Silla de bebé necesaria', 'Carlos López', 'carlos.lopez@example.com', '+34 1489661821', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:09.149', '2026-01-01 22:25:09.149', '36abf4be-10b1-41fc-828d-d5dad19aa2d1');
INSERT INTO public."Booking" VALUES ('a98225a2-dc26-4fc3-82bf-8e1d42d9f9db', '2026-01-26 22:25:03.386', '18:00', 2, NULL, 'Javier Invitado', 'invitado7@example.com', '+34 1369844232', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.156', '2026-01-01 22:25:09.156', '08f7a465-688c-49a6-844e-851afe018875');
INSERT INTO public."Booking" VALUES ('adb31d89-51f3-4117-a17d-343ea34324d8', '2025-12-30 22:25:03.386', '20:30', 6, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 1243662093', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.166', '2026-01-01 22:25:09.166', '543b13f3-2296-48a6-9f85-8b2c42defbc9');
INSERT INTO public."Booking" VALUES ('6cf644e6-23fe-497c-8188-1143ae2a2dc1', '2026-01-16 22:25:03.386', '17:30', 4, NULL, 'Javier Invitado', 'invitado9@example.com', '+34 1135373284', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-01 22:25:09.174', '2026-01-01 22:25:09.174', '08f7a465-688c-49a6-844e-851afe018875');
INSERT INTO public."Booking" VALUES ('ddbccfc4-1128-4a94-a911-46344d35962c', '2026-01-27 22:25:03.386', '20:00', 2, 'Preferimos zona tranquila', 'Carlos López', 'carlos.lopez@example.com', '+34 1203703546', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:09.188', '2026-01-01 22:25:09.188', '27bd1454-9dda-4a14-9632-984d8c4443bf');
INSERT INTO public."Booking" VALUES ('6f958195-af14-4525-bce1-6a94ddf9a401', '2025-12-23 22:25:03.386', '18:30', 8, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 885326509', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:09.199', '2026-01-01 22:25:09.199', 'd6aa73fb-a68c-4fb5-8b85-677de136ad8a');
INSERT INTO public."Booking" VALUES ('b81ebf9e-0ab7-4e69-9834-ac50f3de311c', '2025-12-02 22:25:03.386', '14:30', 2, NULL, 'Miguel Invitado', 'invitado1@example.com', '+34 1418756778', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.206', '2026-01-01 22:25:09.206', '2f49eb6a-d037-4d89-bbf4-b23d13bfb7fd');
INSERT INTO public."Booking" VALUES ('78371676-4435-455d-b662-5f6073e60a41', '2025-12-23 22:25:03.386', '20:30', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 759205885', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:09.221', '2026-01-01 22:25:09.221', '96d351fd-2d36-4bf3-a7c5-962c786a654e');
INSERT INTO public."Booking" VALUES ('b91cf6a9-1f25-4c52-87cd-3ed775369f73', '2025-12-19 22:25:03.386', '14:30', 2, NULL, 'Ana Invitado', 'invitado3@example.com', '+34 1194376598', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.234', '2026-01-01 22:25:09.234', '9f9eb72b-9364-46b6-93f7-98a3f876f1d4');
INSERT INTO public."Booking" VALUES ('dc5cc2cd-be44-4bb1-87fe-09bca2fc30a9', '2026-01-19 22:25:03.386', '18:00', 4, NULL, 'María Invitado', 'invitado4@example.com', '+34 859694350', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.242', '2026-01-01 22:25:09.242', '2f49eb6a-d037-4d89-bbf4-b23d13bfb7fd');
INSERT INTO public."Booking" VALUES ('67544bba-b361-4d0e-b885-3343c1ca0ff4', '2025-12-12 22:25:03.386', '17:00', 6, NULL, 'María Invitado', 'invitado5@example.com', '+34 782662216', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.251', '2026-01-01 22:25:09.251', '96d351fd-2d36-4bf3-a7c5-962c786a654e');
INSERT INTO public."Booking" VALUES ('0a9e4b9d-5827-48da-8fa1-0e561480f4db', '2026-01-06 22:25:03.386', '17:30', 2, 'Alergia a los frutos secos', 'Ana Invitado', 'invitado6@example.com', '+34 1121137886', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.266', '2026-01-01 22:25:09.266', '269a5c4c-5f0c-4620-a517-9d3ef3ca86e3');
INSERT INTO public."Booking" VALUES ('9c7556cd-79c5-4928-954e-147fac0c6c73', '2026-01-07 22:25:03.386', '20:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1077012594', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:09.28', '2026-01-01 22:25:09.28', 'ced498bf-08c8-415a-bda5-596740371b01');
INSERT INTO public."Booking" VALUES ('f10fff20-b72b-4693-9976-052caf9d56e8', '2026-01-22 22:25:03.386', '18:00', 2, 'Silla de bebé necesaria', 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1359056351', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:09.288', '2026-01-01 22:25:09.288', '6b04cbec-0bfe-458d-823b-8ae777f5ee95');
INSERT INTO public."Booking" VALUES ('3090ea05-6075-4e9b-9cab-286b577d2861', '2026-01-19 22:25:03.386', '15:30', 2, 'Cumpleaños, ¿tienen tarta?', 'Carlos Invitado', 'invitado9@example.com', '+34 879016133', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-01 22:25:09.299', '2026-01-01 22:25:09.299', '8a7f9151-c51e-4536-b5e6-052b48c90b52');
INSERT INTO public."Booking" VALUES ('0786eb38-c528-470d-82f4-5e203275ad8d', '2026-01-02 22:25:03.386', '12:00', 2, NULL, 'Carlos Invitado', 'invitado0@example.com', '+34 1465534080', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.35', '2026-01-01 22:25:09.35', 'c9b1fedd-f2eb-4b60-a29f-d1f63140173a');
INSERT INTO public."Booking" VALUES ('7983a596-f0cd-4037-93fb-11d3681878c1', '2025-12-19 22:25:03.386', '17:30', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1495842867', 'COMPLETED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:09.37', '2026-01-01 22:25:09.37', '3517fd5a-0fcf-4ff1-acc1-63bd6afe1bc9');
INSERT INTO public."Booking" VALUES ('c7c1f601-6189-45c4-af9b-2cdd3fd1fb8d', '2026-01-21 22:25:03.386', '16:30', 2, NULL, 'Miguel Invitado', 'invitado2@example.com', '+34 664383164', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.395', '2026-01-01 22:25:09.395', 'c7846d56-25e6-41da-a94f-79e4838df9d4');
INSERT INTO public."Booking" VALUES ('f56933db-b1c1-473e-8335-fd762b5c0f6a', '2026-01-07 22:25:03.386', '21:30', 4, 'Mesa cerca de la ventana por favor', 'María Invitado', 'invitado3@example.com', '+34 884831322', 'PENDING', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.773', '2026-01-01 22:25:09.773', '4021b3f9-a599-4aca-b87a-5ac59abdd3a3');
INSERT INTO public."Booking" VALUES ('b1285277-5e20-482e-9c8c-d6eabbdac513', '2026-01-02 22:25:03.386', '21:00', 2, NULL, 'Miguel Invitado', 'invitado4@example.com', '+34 1465695588', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.815', '2026-01-01 22:25:09.815', '8b19f763-090a-4053-a89b-53c95cb7517c');
INSERT INTO public."Booking" VALUES ('794ef33d-3e72-4c31-821b-9da1756f4d18', '2026-01-25 22:25:03.386', '17:30', 2, NULL, 'Ana Invitado', 'invitado5@example.com', '+34 967997879', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.871', '2026-01-01 22:25:09.871', '3b1d0a7f-a211-4a86-b37f-1e87da41523a');
INSERT INTO public."Booking" VALUES ('1e79d3a6-8910-44f6-a2ea-ff627118a9df', '2025-12-14 22:25:03.386', '13:30', 6, NULL, 'María Invitado', 'invitado6@example.com', '+34 1258397470', 'COMPLETED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.908', '2026-01-01 22:25:09.908', '6a3b7447-ed10-4cbe-b6fc-115b223c18da');
INSERT INTO public."Booking" VALUES ('ea7e3dd3-d0a8-4979-bcaf-b198b0edb19b', '2026-01-17 22:25:03.386', '18:00', 4, NULL, 'Laura Invitado', 'invitado7@example.com', '+34 844707760', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.953', '2026-01-01 22:25:09.953', 'a6c00fd5-fedb-46e7-9d63-e2da94f9afc9');
INSERT INTO public."Booking" VALUES ('8bbd0d63-1058-4081-a6a1-dddbff722201', '2025-12-04 22:25:03.386', '21:30', 2, NULL, 'Laura Invitado', 'invitado8@example.com', '+34 725035074', 'COMPLETED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-01 22:25:09.975', '2026-01-01 22:25:09.975', 'f623b8f4-1235-4730-bccf-4c4a0683042c');
INSERT INTO public."Booking" VALUES ('e6a0f107-07df-4c08-901b-d0391554b83f', '2026-01-30 22:25:03.386', '17:30', 6, NULL, 'Ana Invitado', 'invitado1@example.com', '+34 697999643', 'CONFIRMED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-01 22:25:10.052', '2026-01-01 22:25:10.052', '994c4887-19ee-473f-9d6b-5294100b5955');
INSERT INTO public."Booking" VALUES ('0fe42772-a842-415e-aa14-d06b2b288b70', '2025-12-27 22:25:03.386', '15:00', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1424939432', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:10.091', '2026-01-01 22:25:10.091', 'bdb6ea46-580b-408c-a72d-ccdf8160c719');
INSERT INTO public."Booking" VALUES ('e01252fb-6eed-4e6b-9c9c-9004f3d5b49f', '2025-12-03 22:25:03.386', '17:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 625897151', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:10.121', '2026-01-01 22:25:10.121', 'ddd9979e-d823-4ab4-8dbc-98d094211bf1');
INSERT INTO public."Booking" VALUES ('4cf2300d-39c8-4af4-9df5-df62f036b368', '2025-12-25 22:25:03.386', '15:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1273478145', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:10.163', '2026-01-01 22:25:10.163', 'bdb6ea46-580b-408c-a72d-ccdf8160c719');
INSERT INTO public."Booking" VALUES ('bd9b5853-8f0c-45ed-963b-4770259f0bf9', '2026-01-12 22:25:03.386', '20:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Laura Fernández', 'laura.fernandez@example.com', '+34 632094892', 'CONFIRMED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:10.212', '2026-01-01 22:25:10.212', '1dff4493-2a32-4524-a496-0247865fd3a4');
INSERT INTO public."Booking" VALUES ('182c0a7d-9656-4b89-bfd4-38e22e5b8e80', '2025-12-12 22:25:03.386', '14:30', 4, NULL, 'Laura Invitado', 'invitado6@example.com', '+34 1279069751', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-01 22:25:10.269', '2026-01-01 22:25:10.269', '2ba650ac-ac76-4180-8e98-548f40dfae44');
INSERT INTO public."Booking" VALUES ('fb5d5c8b-c1ef-41f1-adbd-1a0ce07e8c2a', '2025-12-11 22:25:03.386', '12:30', 4, NULL, 'Carlos Invitado', 'invitado7@example.com', '+34 1408678598', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-01 22:25:10.282', '2026-01-01 22:25:10.282', '994c4887-19ee-473f-9d6b-5294100b5955');
INSERT INTO public."Booking" VALUES ('a23e8bff-fd96-4fe1-b7e7-f35a5d5ae226', '2025-12-11 22:25:03.386', '20:00', 2, NULL, 'Carmen Invitado', 'invitado0@example.com', '+34 807546944', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.345', '2026-01-01 22:25:10.345', '1b7ed94e-5e21-4beb-b5f8-6097726dc10e');
INSERT INTO public."Booking" VALUES ('6ce95401-3d03-441e-bb28-ef7290644de1', '2026-01-24 22:25:03.386', '15:00', 2, NULL, 'Javier Invitado', 'invitado1@example.com', '+34 940248662', 'CONFIRMED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.375', '2026-01-01 22:25:10.375', '5b1fa91d-d653-473c-9be7-2cdc05ecc56c');
INSERT INTO public."Booking" VALUES ('7cc411ba-1b33-4679-bc1e-93cc11c23a62', '2025-12-03 22:25:03.386', '21:00', 4, 'Preferimos zona tranquila', 'Ana Martínez', 'ana.martinez@example.com', '+34 964862776', 'CANCELLED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:10.424', '2026-01-01 22:25:10.424', '6f252668-41e7-4aef-8204-6d7bfebd64d9');
INSERT INTO public."Booking" VALUES ('c2ad2346-4f35-4333-8689-c824cff9e08d', '2025-12-28 22:25:03.386', '14:30', 4, NULL, 'Carlos Invitado', 'invitado3@example.com', '+34 1227225435', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.46', '2026-01-01 22:25:10.46', '5b1fa91d-d653-473c-9be7-2cdc05ecc56c');
INSERT INTO public."Booking" VALUES ('1a257bb8-c088-4c64-af90-3f94c9f405f2', '2025-12-16 22:25:03.386', '15:30', 2, 'Silla de bebé necesaria', 'María Invitado', 'invitado4@example.com', '+34 1096976559', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.519', '2026-01-01 22:25:10.519', '5b1fa91d-d653-473c-9be7-2cdc05ecc56c');
INSERT INTO public."Booking" VALUES ('40be1c04-26d3-4bc3-8b0d-4ca6afb1c9e2', '2026-01-08 22:25:03.386', '18:30', 4, 'Mesa cerca de la ventana por favor', 'Carlos López', 'carlos.lopez@example.com', '+34 1128288957', 'PENDING', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:10.59', '2026-01-01 22:25:10.59', '86d4dc65-1b44-4fee-8526-8a0a91b1bb75');
INSERT INTO public."Booking" VALUES ('7a59314e-b426-49f8-9d1e-9f2431851f2a', '2026-01-03 22:25:03.386', '17:30', 4, 'Alergia a los frutos secos', 'Carmen Invitado', 'invitado6@example.com', '+34 618186747', 'PENDING', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.641', '2026-01-01 22:25:10.641', '4b17464f-f192-4c58-a3ed-ad81b90e37ff');
INSERT INTO public."Booking" VALUES ('55d2fae0-3b2b-4777-ae29-ca4a23078e16', '2026-01-07 22:25:03.386', '15:30', 8, NULL, 'David Invitado', 'invitado7@example.com', '+34 1445787138', 'PENDING', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.749', '2026-01-01 22:25:10.749', '92e300ca-2765-4125-88e3-9974dcd8c431');
INSERT INTO public."Booking" VALUES ('fc996097-bf94-4ec2-b93c-947b03048fb8', '2025-12-30 22:25:03.386', '20:30', 6, NULL, 'María García', 'maria.garcia@example.com', '+34 1379951837', 'CONFIRMED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:10.801', '2026-01-01 22:25:10.801', '294d48c1-3c9e-408b-8dc4-c236e00ffb92');
INSERT INTO public."Booking" VALUES ('54bd2b30-42f3-4ca3-9adc-9851fc8cec2c', '2025-12-08 22:25:03.386', '20:00', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1042884171', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:10.817', '2026-01-01 22:25:10.817', '9d4456bb-fca1-4185-b8ff-7ce3b4fb4300');
INSERT INTO public."Booking" VALUES ('667c9c24-67cc-4cca-88d5-8e9eae5efb4f', '2026-01-29 22:25:03.386', '15:00', 2, 'Alergia a los frutos secos', 'Carlos Invitado', 'invitado10@example.com', '+34 1409579931', 'PENDING', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.833', '2026-01-01 22:25:10.833', '6f252668-41e7-4aef-8204-6d7bfebd64d9');
INSERT INTO public."Booking" VALUES ('0032f763-3689-44d6-9543-3af00b1cd5c9', '2025-12-04 22:25:03.386', '13:30', 6, NULL, 'María Invitado', 'invitado11@example.com', '+34 991283560', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-01 22:25:10.845', '2026-01-01 22:25:10.845', '86d4dc65-1b44-4fee-8526-8a0a91b1bb75');
INSERT INTO public."Booking" VALUES ('3799a4bf-9184-469b-9c99-1ea8adf7d200', '2025-12-26 22:25:03.386', '13:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 955380130', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:10.855', '2026-01-01 22:25:10.855', '6f252668-41e7-4aef-8204-6d7bfebd64d9');
INSERT INTO public."Booking" VALUES ('b4cf2dc5-e29d-405b-84b4-9cede32e9fbd', '2025-12-13 22:25:03.386', '17:30', 4, NULL, 'David Invitado', 'invitado0@example.com', '+34 741913003', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:10.867', '2026-01-01 22:25:10.867', '0e5bf2a6-94ee-4ed1-86d8-bf6d9dff97de');
INSERT INTO public."Booking" VALUES ('1c9ac6f5-13cd-4a7a-bff3-1a5459aa7076', '2026-01-11 22:25:03.386', '21:00', 4, 'Mesa cerca de la ventana por favor', 'Miguel Invitado', 'invitado1@example.com', '+34 1048306963', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:10.919', '2026-01-01 22:25:10.919', 'b00fa287-16be-41cf-bd95-c472429413f9');
INSERT INTO public."Booking" VALUES ('44b31fab-be0d-4ef5-a078-0d76f8cb7930', '2026-01-19 22:25:03.386', '14:30', 2, 'Mesa cerca de la ventana por favor', 'Carlos Invitado', 'invitado2@example.com', '+34 909339227', 'CONFIRMED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:10.982', '2026-01-01 22:25:10.982', '5cfe0a52-1632-4862-85cc-f4f2309a1f73');
INSERT INTO public."Booking" VALUES ('8c9de326-22b3-4b65-a3bb-4b0a6bda2579', '2026-01-02 22:25:03.386', '20:00', 8, 'Preferimos zona tranquila', 'Ana Invitado', 'invitado3@example.com', '+34 1100872681', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:11.035', '2026-01-01 22:25:11.035', '91a74c85-568b-45e1-9f9b-c9f1ad1162a8');
INSERT INTO public."Booking" VALUES ('895e62a8-b159-478d-9dec-4f02aa32cbb4', '2026-01-12 22:25:03.386', '17:30', 6, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1052364670', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:11.062', '2026-01-01 22:25:11.062', '67c85dd4-6d64-4f58-8ef8-c155f8434c01');
INSERT INTO public."Booking" VALUES ('8e59a1cb-2623-4f02-93d1-356e2b7cd05b', '2026-01-04 22:25:03.386', '21:30', 2, NULL, 'Miguel Invitado', 'invitado5@example.com', '+34 1193491925', 'CONFIRMED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:11.11', '2026-01-01 22:25:11.11', '5cfe0a52-1632-4862-85cc-f4f2309a1f73');
INSERT INTO public."Booking" VALUES ('a834d062-571d-43b8-80d3-7d2c0c8794ca', '2025-12-06 22:25:03.386', '16:30', 8, 'Silla de bebé necesaria', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 678490182', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:11.16', '2026-01-01 22:25:11.16', 'abdbe6d4-74cd-41e9-9cd1-85f221fa17e7');
INSERT INTO public."Booking" VALUES ('1281bee5-9d78-4d88-a7d5-0370711d475a', '2026-01-14 22:25:03.386', '14:00', 8, 'Silla de bebé necesaria', 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1375909960', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:11.223', '2026-01-01 22:25:11.223', '91a74c85-568b-45e1-9f9b-c9f1ad1162a8');
INSERT INTO public."Booking" VALUES ('27088910-3f65-4c8f-93ba-d99556f4405a', '2025-12-13 22:25:03.386', '20:30', 8, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 702307137', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:11.257', '2026-01-01 22:25:11.257', '5b9a3d6d-1be1-4c20-84a6-39a6451baf74');
INSERT INTO public."Booking" VALUES ('4645f3b0-e41c-47e6-b5c1-5f59ea3aa548', '2025-12-08 22:25:03.386', '12:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1049210283', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:11.334', '2026-01-01 22:25:11.334', 'ed85f38c-0ec1-4ddb-b381-c92fe46d2efe');
INSERT INTO public."Booking" VALUES ('78dd570c-9a9f-4d67-8898-0628cfeb7c7c', '2026-01-07 22:25:03.386', '12:00', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1088237019', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:11.453', '2026-01-01 22:25:11.453', 'ed85f38c-0ec1-4ddb-b381-c92fe46d2efe');
INSERT INTO public."Booking" VALUES ('5bfdfcf8-db04-406d-9b3b-3e54c905206e', '2025-12-09 22:25:03.386', '12:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Miguel Invitado', 'invitado11@example.com', '+34 1476858442', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-01 22:25:11.558', '2026-01-01 22:25:11.558', '331389bd-ad4d-489e-9725-36a8204bfc20');
INSERT INTO public."Booking" VALUES ('567e8978-7b2c-4efd-ae4d-b4b7a63dddab', '2026-01-26 22:25:03.386', '16:30', 2, 'Mesa cerca de la ventana por favor', 'David Rodríguez', 'david.rodriguez@example.com', '+34 680545386', 'PENDING', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:11.75', '2026-01-01 22:25:11.75', '421232b4-8ef9-4a5d-bb17-d4db8b8d26e7');
INSERT INTO public."Booking" VALUES ('e270527b-4c5d-4c39-b2d7-5c12a1eeb90a', '2025-12-20 22:25:03.386', '20:30', 4, NULL, 'Carlos Invitado', 'invitado1@example.com', '+34 878642734', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:11.783', '2026-01-01 22:25:11.783', '50fcd0f2-6306-4316-adbd-329f54d2c2c8');
INSERT INTO public."Booking" VALUES ('395522dc-863f-4fdb-a857-61b5f332739f', '2026-01-07 22:25:03.386', '13:00', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1092123370', 'PENDING', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:11.847', '2026-01-01 22:25:11.847', 'efd3665b-9e2d-4be5-b5ab-e33547dfdf63');
INSERT INTO public."Booking" VALUES ('ff0c5a22-1b65-4912-81ae-9f67b452643f', '2026-01-15 22:25:03.386', '18:30', 8, NULL, 'Laura Invitado', 'invitado3@example.com', '+34 1371342637', 'PENDING', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:11.921', '2026-01-01 22:25:11.921', '930b7290-6e47-41b4-a283-a4ed38c4a980');
INSERT INTO public."Booking" VALUES ('7b00fb98-cfd1-44de-b0d0-a71b326f7639', '2025-12-12 22:25:03.386', '17:30', 4, NULL, 'Ana Invitado', 'invitado4@example.com', '+34 1269125977', 'CANCELLED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:11.952', '2026-01-01 22:25:11.952', '3f8ef646-77ad-4c0a-b2b9-7f3c6db89177');
INSERT INTO public."Booking" VALUES ('5a969a18-eaf3-40db-8896-fdcaa8957a8a', '2025-12-09 22:25:03.386', '19:00', 8, NULL, 'Carlos Invitado', 'invitado5@example.com', '+34 1162205497', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:11.985', '2026-01-01 22:25:11.985', '930b7290-6e47-41b4-a283-a4ed38c4a980');
INSERT INTO public."Booking" VALUES ('51c4dd4e-10d7-46cc-a4a7-0ae259f390f5', '2025-12-02 22:25:03.386', '19:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1185160794', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:12.038', '2026-01-01 22:25:12.038', '421232b4-8ef9-4a5d-bb17-d4db8b8d26e7');
INSERT INTO public."Booking" VALUES ('b42d6b10-6c0d-4590-b4be-f093da52d419', '2026-01-22 22:25:03.386', '12:00', 8, NULL, 'María García', 'maria.garcia@example.com', '+34 723758489', 'CONFIRMED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:12.113', '2026-01-01 22:25:12.113', '930b7290-6e47-41b4-a283-a4ed38c4a980');
INSERT INTO public."Booking" VALUES ('cbe5d08c-a9cd-409e-a2fa-51b2c5dab924', '2026-01-04 22:25:03.386', '17:00', 4, NULL, 'Javier Invitado', 'invitado8@example.com', '+34 1041116735', 'PENDING', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:12.175', '2026-01-01 22:25:12.175', '50fcd0f2-6306-4316-adbd-329f54d2c2c8');
INSERT INTO public."Booking" VALUES ('72ae9350-9c86-4c55-bd67-9cacbc20feaa', '2026-01-24 22:25:03.386', '17:30', 4, NULL, 'Carlos Invitado', 'invitado9@example.com', '+34 1474595736', 'CONFIRMED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:12.191', '2026-01-01 22:25:12.191', '932ebf6d-b3d7-4c8d-852b-c15809f46261');
INSERT INTO public."Booking" VALUES ('dc816b44-d3c8-4cd1-87d9-e66c6db69fe3', '2026-01-02 22:25:03.386', '12:00', 2, NULL, 'Miguel Invitado', 'invitado10@example.com', '+34 643062713', 'CONFIRMED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:12.202', '2026-01-01 22:25:12.202', 'efd3665b-9e2d-4be5-b5ab-e33547dfdf63');
INSERT INTO public."Booking" VALUES ('3772f7b0-4814-4ce9-ab67-cac6afa2ae02', '2025-12-29 22:25:03.386', '21:30', 4, NULL, 'Carlos Invitado', 'invitado11@example.com', '+34 1434515271', 'CANCELLED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:12.234', '2026-01-01 22:25:12.234', '3f8ef646-77ad-4c0a-b2b9-7f3c6db89177');
INSERT INTO public."Booking" VALUES ('114964fe-971e-4dad-aa03-9c4cc85dc0b1', '2026-01-25 22:25:03.386', '17:00', 4, NULL, 'Carmen Invitado', 'invitado12@example.com', '+34 1485118389', 'CONFIRMED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-01 22:25:12.295', '2026-01-01 22:25:12.295', 'efd3665b-9e2d-4be5-b5ab-e33547dfdf63');
INSERT INTO public."Booking" VALUES ('4297e242-8c15-4082-9221-4ecab2eac7a0', '2026-01-22 22:25:03.386', '20:00', 2, NULL, 'Carlos Invitado', 'invitado0@example.com', '+34 850249416', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.335', '2026-01-01 22:25:12.335', '6fb3bc6a-41aa-4715-b687-6ac4f4601e40');
INSERT INTO public."Booking" VALUES ('209c90e1-14b5-4619-b237-7b60c9faaa22', '2025-12-06 22:25:03.386', '15:00', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 890403911', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:12.387', '2026-01-01 22:25:12.387', '7c866212-33c6-4106-bb43-0d6711a79f50');
INSERT INTO public."Booking" VALUES ('5256aa12-817d-4c27-a2d0-0e82411f84c7', '2026-01-04 22:25:03.386', '15:30', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1423608026', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:12.468', '2026-01-01 22:25:12.468', '8e7ad85b-00c8-4bfb-beae-15dc4268f9a8');
INSERT INTO public."Booking" VALUES ('461b4d70-88f3-401a-9d81-0f121ebcdd5b', '2025-12-28 22:25:03.386', '21:30', 4, NULL, 'Javier Invitado', 'invitado3@example.com', '+34 1060409983', 'CANCELLED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.52', '2026-01-01 22:25:12.52', '17b49230-23f2-48f3-90be-d0507a75d4ac');
INSERT INTO public."Booking" VALUES ('22faa39f-0729-4571-a650-9beccfa05384', '2025-12-06 22:25:03.386', '17:00', 6, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1495132711', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:12.562', '2026-01-01 22:25:12.562', 'c7d82531-20be-4ad4-89f5-bff60ba8927f');
INSERT INTO public."Booking" VALUES ('f84d6494-6e17-406d-830c-28edcdd27b0f', '2025-12-03 22:25:03.386', '12:00', 2, 'Silla de bebé necesaria', 'David Invitado', 'invitado5@example.com', '+34 1144672815', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.645', '2026-01-01 22:25:12.645', '4a63621d-dbd2-41c7-8850-d18c11c53394');
INSERT INTO public."Booking" VALUES ('0e521c09-3739-4f1d-8705-fb3db01000cb', '2025-12-27 22:25:03.386', '21:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1432357193', 'CANCELLED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:12.687', '2026-01-01 22:25:12.687', '1e3e8593-7e6d-431d-9020-729ea5e7421b');
INSERT INTO public."Booking" VALUES ('229d67db-9ee6-4d39-a129-8cd91c659fe5', '2026-01-30 22:25:03.386', '17:00', 8, NULL, 'Laura Invitado', 'invitado7@example.com', '+34 998166627', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.754', '2026-01-01 22:25:12.754', 'c5d8b642-c77b-4ea0-8c33-a0af850c9961');
INSERT INTO public."Booking" VALUES ('fdad83e3-22e0-4d09-9bef-8a3d65039b15', '2025-12-28 22:25:03.386', '20:00', 4, NULL, 'Laura Invitado', 'invitado8@example.com', '+34 909863304', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.793', '2026-01-01 22:25:12.793', '4eee1e3d-1ee3-470b-93c8-dc13e3e91074');
INSERT INTO public."Booking" VALUES ('efaf9232-d938-4154-bd91-dad961963683', '2025-12-12 22:25:03.386', '20:30', 6, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1020328901', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:12.803', '2026-01-01 22:25:12.803', 'c5d8b642-c77b-4ea0-8c33-a0af850c9961');
INSERT INTO public."Booking" VALUES ('fa932a61-c279-4417-8d71-f5086ab4dd45', '2026-01-02 22:25:03.386', '18:30', 4, 'Preferimos zona tranquila', 'Ana Invitado', 'invitado10@example.com', '+34 670561646', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-01 22:25:12.811', '2026-01-01 22:25:12.811', 'c7d82531-20be-4ad4-89f5-bff60ba8927f');
INSERT INTO public."Booking" VALUES ('f9e18bb7-67fc-4902-b52f-4e2dc2780c0c', '2026-01-06 22:25:03.386', '12:00', 2, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 681802494', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:12.823', '2026-01-01 22:25:12.823', '8e7ad85b-00c8-4bfb-beae-15dc4268f9a8');
INSERT INTO public."Booking" VALUES ('f3482150-377c-43b5-8bb2-c13c194c8318', '2026-01-24 22:25:03.386', '14:30', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 707049076', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:12.839', '2026-01-01 22:25:12.839', '1e3e8593-7e6d-431d-9020-729ea5e7421b');
INSERT INTO public."Booking" VALUES ('e7971d77-5ca0-456d-8fa9-b8f524b540b2', '2025-12-10 22:25:03.386', '20:30', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1146663163', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:12.866', '2026-01-01 22:25:12.866', '844bd793-38b7-4f70-a7da-b96b94184878');
INSERT INTO public."Booking" VALUES ('efeca690-fe37-4fe3-8179-b500b85e6ddd', '2026-01-22 22:25:03.386', '19:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1404625584', 'CONFIRMED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:12.882', '2026-01-01 22:25:12.882', '844bd793-38b7-4f70-a7da-b96b94184878');
INSERT INTO public."Booking" VALUES ('e76d0cbc-ea68-425a-ba91-5b9ad387e5bd', '2025-12-17 22:25:03.386', '18:30', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 934943428', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-01 22:25:12.89', '2026-01-01 22:25:12.89', '8ff401b6-f65d-49fc-b81a-7562d47e4e17');
INSERT INTO public."Booking" VALUES ('a282fd93-207f-4763-87da-7983986b9993', '2025-12-18 22:25:03.386', '15:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1336302459', 'CANCELLED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:12.922', '2026-01-01 22:25:12.922', '8ff401b6-f65d-49fc-b81a-7562d47e4e17');
INSERT INTO public."Booking" VALUES ('32510b7c-3fb9-4b69-94aa-647d2cce3c02', '2026-01-08 22:25:03.386', '20:00', 2, 'Mesa cerca de la ventana por favor', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1476520403', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:12.946', '2026-01-01 22:25:12.946', '859ca1b7-3a17-43a7-a300-660fc084f918');
INSERT INTO public."Booking" VALUES ('7c4afb7e-40da-4477-afb8-e6fb47ced3f3', '2026-01-13 22:25:03.386', '14:00', 2, 'Preferimos zona tranquila', 'Laura Invitado', 'invitado5@example.com', '+34 920543959', 'CONFIRMED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-01 22:25:12.956', '2026-01-01 22:25:12.956', '51342893-2162-4fde-96e1-7c4028f50e6c');
INSERT INTO public."Booking" VALUES ('101de597-4da6-4da6-948d-5c717fb3c4b1', '2026-01-08 22:25:03.386', '12:00', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1455091268', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:12.971', '2026-01-01 22:25:12.971', '51342893-2162-4fde-96e1-7c4028f50e6c');
INSERT INTO public."Booking" VALUES ('b17c8dca-d0f6-4c16-a62d-fd7ed77e2f0c', '2025-12-20 22:25:03.386', '12:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1062456923', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:13.009', '2026-01-01 22:25:13.009', '51342893-2162-4fde-96e1-7c4028f50e6c');
INSERT INTO public."Booking" VALUES ('b5010cc9-fb5b-4b8c-baae-c2f4f62a9eab', '2025-12-07 22:25:03.386', '19:00', 2, 'Preferimos zona tranquila', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 749664696', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:13.078', '2026-01-01 22:25:13.078', 'ada903c3-5218-4693-8194-419ddd1f89ac');
INSERT INTO public."Booking" VALUES ('9d9409c0-4f2d-4150-bd06-bdf6d5b4882f', '2025-12-15 22:25:03.386', '12:30', 2, NULL, 'Javier Invitado', 'invitado1@example.com', '+34 924250989', 'CANCELLED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.153', '2026-01-01 22:25:13.153', 'ada903c3-5218-4693-8194-419ddd1f89ac');
INSERT INTO public."Booking" VALUES ('a35801ff-9e9d-4071-b24f-b7cee24a5ac6', '2025-12-13 22:25:03.386', '12:30', 4, NULL, 'Carmen Invitado', 'invitado2@example.com', '+34 1339209392', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.202', '2026-01-01 22:25:13.202', '0e2a14eb-4ce6-4549-9714-e8c43ba2dd99');
INSERT INTO public."Booking" VALUES ('f6395cd3-1a3f-4ad4-afb4-ebe1f629ca07', '2026-01-08 22:25:03.386', '20:30', 2, 'Alergia a los frutos secos', 'David Invitado', 'invitado3@example.com', '+34 796841833', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.27', '2026-01-01 22:25:13.27', 'ada903c3-5218-4693-8194-419ddd1f89ac');
INSERT INTO public."Booking" VALUES ('e4ba6ef5-8fd9-4753-9218-dfbe09106007', '2026-01-09 22:25:03.386', '12:00', 4, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado4@example.com', '+34 1332494395', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.328', '2026-01-01 22:25:13.328', '0e2a14eb-4ce6-4549-9714-e8c43ba2dd99');
INSERT INTO public."Booking" VALUES ('9c5f7171-1d63-4a24-8c18-e7de661cd003', '2025-12-04 22:25:03.386', '14:00', 4, NULL, 'Carlos Invitado', 'invitado5@example.com', '+34 869916744', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.416', '2026-01-01 22:25:13.416', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('da233e19-0c7c-49ec-b513-f3d520789446', '2025-12-24 22:25:03.386', '20:00', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1132822493', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:13.513', '2026-01-01 22:25:13.513', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('aca8f6b5-66b5-4976-a325-f2925663970c', '2025-12-24 22:25:03.386', '16:00', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 800347784', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:13.616', '2026-01-01 22:25:13.616', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('18c4f41b-3f73-4255-ae3a-12eb98fdaf0b', '2026-01-28 22:25:03.386', '17:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 692188208', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:13.721', '2026-01-01 22:25:13.721', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('d23625bf-ea11-4edd-a1de-eaf47ec5b148', '2025-12-06 22:25:03.386', '16:00', 4, NULL, 'Laura Invitado', 'invitado9@example.com', '+34 1154797040', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-01 22:25:13.801', '2026-01-01 22:25:13.801', '0e2a14eb-4ce6-4549-9714-e8c43ba2dd99');
INSERT INTO public."Booking" VALUES ('dbc84270-aa62-4886-8253-3df9a59210b4', '2025-12-21 22:25:03.386', '15:30', 2, 'Alergia a los frutos secos', 'David Rodríguez', 'david.rodriguez@example.com', '+34 1454778950', 'CANCELLED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:13.866', '2026-01-01 22:25:13.866', 'fecb1862-1447-4c15-a69b-4d834f59e544');
INSERT INTO public."Booking" VALUES ('9598bb8f-5862-426b-8b1e-b317b025d00f', '2025-12-06 22:25:03.386', '17:00', 4, 'Mesa cerca de la ventana por favor', 'Ana Martínez', 'ana.martinez@example.com', '+34 1328796743', 'COMPLETED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:14', '2026-01-01 22:25:14', '50397fd4-f669-4cd5-a5f2-af2fb7665faa');
INSERT INTO public."Booking" VALUES ('02b45c0e-b0b2-4934-a0f5-f6c48f27a73e', '2026-01-07 22:25:03.386', '20:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1095227027', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:14.086', '2026-01-01 22:25:14.086', 'd6df436a-23a0-47de-b93c-94ed7d4b3e7f');
INSERT INTO public."Booking" VALUES ('224015ac-eb65-4ff8-aaf5-3ff05948215b', '2026-01-07 22:25:03.386', '21:30', 4, NULL, 'Carmen Invitado', 'invitado2@example.com', '+34 901134839', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-01 22:25:14.156', '2026-01-01 22:25:14.156', '5f3f01f3-7325-40bf-830d-bd2db168b0b7');
INSERT INTO public."Booking" VALUES ('23356b32-c51f-472f-932f-3a374ae8d5a9', '2026-01-21 22:25:03.386', '16:00', 2, NULL, 'Carmen Invitado', 'invitado3@example.com', '+34 1203234909', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-01 22:25:14.189', '2026-01-01 22:25:14.189', '26623647-18aa-4373-9299-541f0e36673e');
INSERT INTO public."Booking" VALUES ('a9af8ae0-6462-4ef0-9bc6-7c2a6682da3c', '2026-01-20 22:25:03.386', '19:30', 4, 'Alergia a los frutos secos', 'Laura Fernández', 'laura.fernandez@example.com', '+34 850093225', 'PENDING', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:14.249', '2026-01-01 22:25:14.249', '5f3f01f3-7325-40bf-830d-bd2db168b0b7');
INSERT INTO public."Booking" VALUES ('c1ed8bcb-06cb-4f84-ac60-ce3fb5e15f98', '2025-12-31 22:25:03.386', '13:30', 4, NULL, 'Javier Invitado', 'invitado5@example.com', '+34 1091293108', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-01 22:25:14.312', '2026-01-01 22:25:14.312', '01eb5535-74de-43ee-b08b-acaddf876d0e');
INSERT INTO public."Booking" VALUES ('b5d0657f-e7dd-4826-8bbe-2d44a7b1aff5', '2025-12-10 22:25:03.386', '13:30', 6, NULL, 'Carlos Invitado', 'invitado6@example.com', '+34 1258350230', 'COMPLETED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-01 22:25:14.359', '2026-01-01 22:25:14.359', '33d45a78-3309-4df6-9165-3b0495defefc');
INSERT INTO public."Booking" VALUES ('1be242de-166e-416f-a62e-e4150d880002', '2025-12-17 22:25:03.386', '19:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1428688812', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:14.492', '2026-01-01 22:25:14.492', 'faaddc74-7eaf-4578-b7cb-413d0ad32125');
INSERT INTO public."Booking" VALUES ('360ebb1b-d7cf-4d0d-8a76-ef68015b8f69', '2025-12-25 22:25:03.386', '16:00', 2, NULL, 'Javier Invitado', 'invitado1@example.com', '+34 1172977519', 'CANCELLED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:14.513', '2026-01-01 22:25:14.513', 'faaddc74-7eaf-4578-b7cb-413d0ad32125');
INSERT INTO public."Booking" VALUES ('c857df2d-800e-4ba3-99d7-1e2b351e75c4', '2026-01-12 22:25:03.386', '14:30', 4, NULL, 'María Invitado', 'invitado2@example.com', '+34 915271638', 'CONFIRMED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:14.602', '2026-01-01 22:25:14.602', 'faaddc74-7eaf-4578-b7cb-413d0ad32125');
INSERT INTO public."Booking" VALUES ('84b87373-53cb-4f73-92c4-17582621314c', '2025-12-02 22:25:03.386', '18:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 626972491', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:14.728', '2026-01-01 22:25:14.728', '71336291-373e-43c9-be3d-e302946e78c6');
INSERT INTO public."Booking" VALUES ('3853dcb6-4934-4b87-b9f4-0e3010dc378b', '2025-12-12 22:25:03.386', '16:00', 4, 'Mesa cerca de la ventana por favor', 'Ana Invitado', 'invitado4@example.com', '+34 878160458', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:14.805', '2026-01-01 22:25:14.805', '71336291-373e-43c9-be3d-e302946e78c6');
INSERT INTO public."Booking" VALUES ('7cc75871-6464-4ad4-9036-504b4484edb7', '2026-01-09 22:25:03.386', '16:30', 4, NULL, 'Ana Invitado', 'invitado5@example.com', '+34 1005133648', 'CONFIRMED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:14.853', '2026-01-01 22:25:14.853', 'cd728970-f32b-4583-93c2-b18aa7c880ea');
INSERT INTO public."Booking" VALUES ('1f809a48-f7f9-4073-8efc-85ff27eb5214', '2026-01-03 22:25:03.386', '21:30', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 638253087', 'PENDING', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:14.945', '2026-01-01 22:25:14.945', '5bea3bd4-9395-4090-a921-7f0764dd3c11');
INSERT INTO public."Booking" VALUES ('7c2dab3b-81ec-4baf-bae3-0526d617b780', '2025-12-26 22:25:03.386', '18:30', 4, 'Mesa cerca de la ventana por favor', 'Carlos López', 'carlos.lopez@example.com', '+34 1015072135', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:14.995', '2026-01-01 22:25:14.995', 'cd728970-f32b-4583-93c2-b18aa7c880ea');
INSERT INTO public."Booking" VALUES ('bbe45cc7-41c6-4554-9861-0eee99b9d1f3', '2025-12-06 22:25:03.386', '17:00', 6, NULL, 'Carmen Invitado', 'invitado8@example.com', '+34 1240788792', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:15.058', '2026-01-01 22:25:15.058', '5bea3bd4-9395-4090-a921-7f0764dd3c11');
INSERT INTO public."Booking" VALUES ('861ceba9-1998-4a23-82ee-41edf743c782', '2025-12-06 22:25:03.386', '20:30', 4, NULL, 'Laura Invitado', 'invitado9@example.com', '+34 1469381958', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:15.069', '2026-01-01 22:25:15.069', '5bea3bd4-9395-4090-a921-7f0764dd3c11');
INSERT INTO public."Booking" VALUES ('6b365523-bf2e-4a9d-8a5b-b83bc926bb27', '2025-12-07 22:25:03.386', '17:00', 8, NULL, 'Miguel Invitado', 'invitado10@example.com', '+34 692723656', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-01 22:25:15.084', '2026-01-01 22:25:15.084', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('b6fd51af-6982-4540-91e5-a84538fd7bdb', '2025-12-10 22:25:03.386', '14:00', 8, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 966682513', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:15.093', '2026-01-01 22:25:15.093', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('ce870ebf-9c39-44b5-bf1e-97768e25e7f0', '2025-12-04 22:25:03.386', '21:00', 2, NULL, 'Ana Invitado', 'invitado0@example.com', '+34 620682330', 'COMPLETED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-01 22:25:15.117', '2026-01-01 22:25:15.117', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('56e099d5-1b8c-4650-807a-af94a88fed2b', '2026-01-27 22:25:03.386', '21:30', 8, NULL, 'Miguel Invitado', 'invitado1@example.com', '+34 1435336460', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-01 22:25:15.138', '2026-01-01 22:25:15.138', '45de265a-6b21-432d-930c-a9e8cf50fc76');
INSERT INTO public."Booking" VALUES ('f0e136ff-b240-4a12-8e29-29c13e3ede2f', '2026-01-04 22:25:03.386', '20:30', 4, 'Alergia a los frutos secos', 'David Invitado', 'invitado2@example.com', '+34 706530471', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-01 22:25:15.188', '2026-01-01 22:25:15.188', 'b0ed2b4b-d7f5-40cc-ab65-dd8589baae3f');
INSERT INTO public."Booking" VALUES ('270d4abd-d3a9-4de4-ac11-039219cd7f9e', '2025-12-23 22:25:03.386', '20:00', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1061099985', 'COMPLETED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:15.199', '2026-01-01 22:25:15.199', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('ba543994-4259-4449-965a-3a57fbd05173', '2026-01-24 22:25:03.386', '14:30', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1361794823', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:15.219', '2026-01-01 22:25:15.219', 'b0ed2b4b-d7f5-40cc-ab65-dd8589baae3f');
INSERT INTO public."Booking" VALUES ('27d9805f-7df2-49d9-8eaa-7e35d1f6d225', '2026-01-01 22:25:03.386', '16:00', 4, 'Silla de bebé necesaria', 'Laura Fernández', 'laura.fernandez@example.com', '+34 844456331', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:15.236', '2026-01-01 22:25:15.236', 'b0ed2b4b-d7f5-40cc-ab65-dd8589baae3f');
INSERT INTO public."Booking" VALUES ('7390fb88-ce18-4ba8-8990-49ab2cddeaca', '2026-01-29 22:25:03.386', '15:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Ana Martínez', 'ana.martinez@example.com', '+34 793242922', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:15.246', '2026-01-01 22:25:15.246', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('b7fe131e-de26-4a09-ac1a-03a057bb6761', '2026-01-14 22:25:03.386', '13:00', 4, NULL, 'Miguel Invitado', 'invitado7@example.com', '+34 919974928', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-01 22:25:15.291', '2026-01-01 22:25:15.291', '45de265a-6b21-432d-930c-a9e8cf50fc76');
INSERT INTO public."Booking" VALUES ('c8900c3f-b68d-440d-b4fc-774dd1726da5', '2026-01-30 22:25:03.386', '21:30', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 967404242', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:15.316', '2026-01-01 22:25:15.316', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('fda4e625-2885-4b6c-857e-ac17e2e22acb', '2025-12-16 22:25:03.386', '16:30', 4, NULL, 'Carmen Invitado', 'invitado0@example.com', '+34 1268800460', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-01 22:25:15.335', '2026-01-01 22:25:15.335', '433ab3de-b2d4-4665-b9e8-d2ec530ac70a');
INSERT INTO public."Booking" VALUES ('29795dda-9a8b-4fb4-849d-afa65342d267', '2025-12-16 22:25:03.386', '20:00', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 750842292', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:15.383', '2026-01-01 22:25:15.383', '71640588-e23f-410b-81dd-06bc2e1f8f5b');
INSERT INTO public."Booking" VALUES ('a7056646-ed12-4880-9a9d-eb4b1522b803', '2026-01-07 22:25:03.386', '16:30', 8, 'Preferimos zona tranquila', 'Ana Martínez', 'ana.martinez@example.com', '+34 1036666398', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:15.692', '2026-01-01 22:25:15.692', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('def08b99-d8ce-44c3-b713-688a47718cd9', '2025-12-17 22:25:03.386', '16:00', 6, NULL, 'María Invitado', 'invitado3@example.com', '+34 1206736227', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-01 22:25:15.736', '2026-01-01 22:25:15.736', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('3cbdffec-eee5-4529-bac8-87d1072fbfca', '2026-01-11 22:25:03.386', '12:00', 6, NULL, 'Miguel Invitado', 'invitado4@example.com', '+34 658880876', 'PENDING', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-01 22:25:15.791', '2026-01-01 22:25:15.791', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('885db74d-1788-4823-b242-136db18e24f4', '2026-01-15 22:25:03.386', '16:00', 8, NULL, 'Javier Invitado', 'invitado5@example.com', '+34 740089753', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-01 22:25:15.808', '2026-01-01 22:25:15.808', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('5fcd9b8f-89bd-4e3e-81bc-ba1db0967b41', '2026-01-07 22:25:03.386', '13:00', 2, NULL, 'Ana Invitado', 'invitado6@example.com', '+34 1441740502', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-01 22:25:15.873', '2026-01-01 22:25:15.873', '5bca5e92-f2a1-4904-afec-deec2f36fe6f');
INSERT INTO public."Booking" VALUES ('bd87661c-e67c-4edc-8f00-ec7bb7488c6d', '2026-01-05 22:25:03.386', '12:30', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1030712935', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-01 22:25:15.917', '2026-01-01 22:25:15.917', '5bca5e92-f2a1-4904-afec-deec2f36fe6f');
INSERT INTO public."Booking" VALUES ('31860fe4-9cfe-4e17-9991-96451f06c674', '2025-12-20 22:25:03.386', '15:00', 6, 'Mesa cerca de la ventana por favor', 'Carlos Invitado', 'invitado0@example.com', '+34 698498453', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.03', '2026-01-01 22:25:16.03', '9dca8696-1644-4058-9d8b-adaebc47e625');
INSERT INTO public."Booking" VALUES ('a07ad24d-8a6d-4ba2-a0e3-469e4e34faa8', '2025-12-27 22:25:03.386', '15:30', 4, 'Mesa cerca de la ventana por favor', 'María Invitado', 'invitado1@example.com', '+34 699435964', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.1', '2026-01-01 22:25:16.1', '5f264000-4a93-4718-b5d9-3dce4dffe947');
INSERT INTO public."Booking" VALUES ('0d5a7711-5acd-41ad-a252-4c4d05e60883', '2025-12-02 22:25:03.386', '16:00', 8, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado2@example.com', '+34 1422233710', 'CANCELLED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.154', '2026-01-01 22:25:16.154', 'd97a0e8f-b9d8-42bb-ab78-5775bc6d8250');
INSERT INTO public."Booking" VALUES ('2ad0f6bf-22ce-4101-9ddf-a2dc115e6a8b', '2026-01-28 22:25:03.386', '19:30', 2, NULL, 'Carlos Invitado', 'invitado3@example.com', '+34 1145392842', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.227', '2026-01-01 22:25:16.227', 'b28cd6be-5144-47a4-82ba-83f8dfb85927');
INSERT INTO public."Booking" VALUES ('dd2fecad-ecbc-43b6-887b-e96b488afc56', '2026-01-24 22:25:03.386', '13:30', 2, NULL, 'Laura Invitado', 'invitado4@example.com', '+34 1477449186', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.263', '2026-01-01 22:25:16.263', 'cfaeae61-75a1-4a3e-b34c-46795146b9d6');
INSERT INTO public."Booking" VALUES ('601309e9-f58c-44fd-8e88-9ac3a409e56f', '2026-01-17 22:25:03.386', '14:30', 2, 'Cumpleaños, ¿tienen tarta?', 'Miguel Invitado', 'invitado5@example.com', '+34 1283566102', 'CONFIRMED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.309', '2026-01-01 22:25:16.309', 'cfaeae61-75a1-4a3e-b34c-46795146b9d6');
INSERT INTO public."Booking" VALUES ('341ebea0-e713-43fd-a357-000cf73bf603', '2025-12-30 22:25:03.386', '18:30', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 634572305', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'cmjw0jj270001mizjrndtq19q', '2026-01-01 22:25:16.353', '2026-01-01 22:25:16.353', 'b28cd6be-5144-47a4-82ba-83f8dfb85927');
INSERT INTO public."Booking" VALUES ('03187a15-e902-426b-b8e3-63d15104d7ea', '2026-01-07 22:25:03.386', '20:00', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1287732596', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'cmjw0jj3p0005mizj19j864z4', '2026-01-01 22:25:16.405', '2026-01-01 22:25:16.405', 'fff8d93b-0f13-4185-8399-b2981fd32f18');
INSERT INTO public."Booking" VALUES ('5029b23b-d3ea-4e07-93cc-fb7437819532', '2025-12-11 22:25:03.386', '19:30', 2, 'Mesa cerca de la ventana por favor', 'Miguel Invitado', 'invitado8@example.com', '+34 759475848', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-01 22:25:16.455', '2026-01-01 22:25:16.455', 'eceb48bd-b8ed-4f75-834b-0d9a67c53859');
INSERT INTO public."Booking" VALUES ('147adf71-1a24-4836-b5d9-d5a81ceb4b16', '2025-12-28 22:25:03.386', '15:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1074969447', 'CANCELLED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:16.559', '2026-01-01 22:25:16.559', 'e2e24a91-9cf9-45a7-b7f5-8f3fd191926c');
INSERT INTO public."Booking" VALUES ('964fe846-5768-48f9-a290-e15afbdb4c31', '2026-01-08 22:25:03.386', '13:30', 4, 'Mesa cerca de la ventana por favor', 'Javier Invitado', 'invitado1@example.com', '+34 953182160', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.626', '2026-01-01 22:25:16.626', '833eb749-6342-43ec-b18d-8f1f0b5f736f');
INSERT INTO public."Booking" VALUES ('499089d1-eb75-4733-9960-bedd87800183', '2026-01-03 22:25:03.386', '19:30', 6, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado2@example.com', '+34 1132896263', 'PENDING', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.635', '2026-01-01 22:25:16.635', 'fa0e25dc-adc6-4616-850d-086b489822b5');
INSERT INTO public."Booking" VALUES ('f19452ab-28c8-4fb9-bd5b-5f8b80987211', '2025-12-13 22:25:03.386', '14:30', 8, 'Silla de bebé necesaria', 'David Rodríguez', 'david.rodriguez@example.com', '+34 709394867', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-01 22:25:16.648', '2026-01-01 22:25:16.648', 'b1c2d26d-578a-4c81-bdf9-7b263dae3f9e');
INSERT INTO public."Booking" VALUES ('01a7e6e2-1f0e-481f-8dfd-b82650a2bc44', '2025-12-22 22:25:03.386', '13:00', 4, NULL, 'Ana Invitado', 'invitado4@example.com', '+34 1429989398', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.655', '2026-01-01 22:25:16.655', 'f37edf7e-dfa9-434f-ae38-100489605fdd');
INSERT INTO public."Booking" VALUES ('ed95f1b3-cf5c-436e-9fed-170f2a6b1db8', '2025-12-04 22:25:03.386', '13:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1084417075', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:16.667', '2026-01-01 22:25:16.667', 'fa0e25dc-adc6-4616-850d-086b489822b5');
INSERT INTO public."Booking" VALUES ('eae0918c-70f5-475f-bb91-703fb3cfd0b3', '2026-01-25 22:25:03.386', '15:30', 2, NULL, 'Carlos Invitado', 'invitado6@example.com', '+34 1137549150', 'PENDING', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.675', '2026-01-01 22:25:16.675', '6a9c8396-2c93-4115-bf00-4a239fa0365d');
INSERT INTO public."Booking" VALUES ('d00d83ee-b943-49cc-95bc-4798dc27cdb8', '2026-01-01 22:25:03.386', '20:30', 4, 'Mesa cerca de la ventana por favor', 'Carlos Invitado', 'invitado7@example.com', '+34 912587589', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.702', '2026-01-01 22:25:16.702', 'e2e24a91-9cf9-45a7-b7f5-8f3fd191926c');
INSERT INTO public."Booking" VALUES ('9da9df58-0fa6-4e17-b03a-1dccf489541b', '2026-01-11 22:25:03.386', '17:30', 2, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 891334333', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.718', '2026-01-01 22:25:16.718', 'f37edf7e-dfa9-434f-ae38-100489605fdd');
INSERT INTO public."Booking" VALUES ('13809cb0-1ec3-4247-84c8-1c8fa453de39', '2025-12-20 22:25:03.386', '18:30', 2, NULL, 'Javier Invitado', 'invitado9@example.com', '+34 647048202', 'CANCELLED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.768', '2026-01-01 22:25:16.768', 'c443bd69-f472-4e17-877a-3b9efdfcde97');
INSERT INTO public."Booking" VALUES ('bf68145e-5181-48c1-be00-7e59865b6e7d', '2025-12-29 22:25:03.386', '15:00', 6, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 822923647', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj4g0007mizj541ffey5', '2026-01-01 22:25:16.804', '2026-01-01 22:25:16.804', 'aec72ffd-2d0a-4fd3-b020-1fe80c911b85');
INSERT INTO public."Booking" VALUES ('50a1c864-5136-4732-9979-c91d1dfbdc73', '2026-01-01 22:25:03.386', '12:00', 2, NULL, 'Javier Invitado', 'invitado11@example.com', '+34 873628972', 'PENDING', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-01 22:25:16.825', '2026-01-01 22:25:16.825', '6a9c8396-2c93-4115-bf00-4a239fa0365d');
INSERT INTO public."Booking" VALUES ('b405b16c-8f2f-4818-94e5-65784eda3aca', '2025-12-23 22:25:03.386', '13:30', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 622158141', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-01 22:25:16.85', '2026-01-01 22:25:16.85', '053d0c87-f41f-4189-9c95-7767d63fcbae');
INSERT INTO public."Booking" VALUES ('70cd6995-bff2-4669-859a-84a4690f6f79', '2026-01-07 22:25:03.386', '12:00', 4, NULL, 'María Invitado', 'invitado1@example.com', '+34 650117555', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.858', '2026-01-01 22:25:16.858', 'a9e5f96f-d6be-40cf-a58a-54d146704c58');
INSERT INTO public."Booking" VALUES ('02faa8c4-b2b8-4de3-aa47-cd415c357be2', '2026-01-06 22:25:03.386', '20:30', 4, 'Cumpleaños, ¿tienen tarta?', 'Ana Invitado', 'invitado2@example.com', '+34 914342005', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.866', '2026-01-01 22:25:16.866', '2d5ab711-3146-497e-b294-c3132c7f1868');
INSERT INTO public."Booking" VALUES ('9f31b81f-a8d6-42db-83e3-f4d2b9755a91', '2025-12-26 22:25:03.386', '21:30', 8, NULL, 'María Invitado', 'invitado3@example.com', '+34 643012706', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.876', '2026-01-01 22:25:16.876', '57e68a8a-44ff-4633-ad1d-d1658511ce25');
INSERT INTO public."Booking" VALUES ('b8dd446d-bd51-4b80-96be-0b135081053f', '2026-01-18 22:25:03.386', '15:30', 4, 'Mesa cerca de la ventana por favor', 'Laura Invitado', 'invitado4@example.com', '+34 1187683827', 'PENDING', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.889', '2026-01-01 22:25:16.889', 'a9e5f96f-d6be-40cf-a58a-54d146704c58');
INSERT INTO public."Booking" VALUES ('84c0d75e-f90d-42c7-846e-407a39664454', '2025-12-18 22:25:03.386', '20:30', 2, 'Alergia a los frutos secos', 'David Invitado', 'invitado5@example.com', '+34 615922809', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.901', '2026-01-01 22:25:16.901', '390eb5e9-e5a8-4ed8-b4f9-935bbf6e8f0b');
INSERT INTO public."Booking" VALUES ('bb9da132-04a5-499a-8843-f5f6f4bd13fd', '2025-12-28 22:25:03.386', '14:00', 6, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 778265196', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj2j0002mizjdn003odp', '2026-01-01 22:25:16.912', '2026-01-01 22:25:16.912', '1a3adc62-d52e-4db0-ada3-9f04687bd816');
INSERT INTO public."Booking" VALUES ('539ce175-753d-4557-8f38-eb67d213e585', '2025-12-12 22:25:03.386', '14:30', 8, 'Mesa cerca de la ventana por favor', 'María Invitado', 'invitado7@example.com', '+34 1033222646', 'CANCELLED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.92', '2026-01-01 22:25:16.92', '57e68a8a-44ff-4633-ad1d-d1658511ce25');
INSERT INTO public."Booking" VALUES ('132d6671-9891-4c60-a67b-4723f563e93a', '2026-01-24 22:25:03.386', '20:30', 2, 'Mesa cerca de la ventana por favor', 'Ana Invitado', 'invitado8@example.com', '+34 1041249941', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.926', '2026-01-01 22:25:16.926', '053d0c87-f41f-4189-9c95-7767d63fcbae');
INSERT INTO public."Booking" VALUES ('8ef61c13-cb87-4b70-9775-adb145e97a4e', '2025-12-15 22:25:03.386', '18:00', 2, NULL, 'Ana Invitado', 'invitado9@example.com', '+34 894104483', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.935', '2026-01-01 22:25:16.935', 'e0afdedf-d89b-4895-910f-d7701c6bcd0f');
INSERT INTO public."Booking" VALUES ('e7f5ccd0-d3d7-4544-95a8-e5a37af04174', '2025-12-29 22:25:03.386', '21:30', 2, 'Preferimos zona tranquila', 'Carlos Invitado', 'invitado10@example.com', '+34 989359705', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-01 22:25:16.943', '2026-01-01 22:25:16.943', 'a9e5f96f-d6be-40cf-a58a-54d146704c58');
INSERT INTO public."Booking" VALUES ('84aeb737-959a-4cf2-8379-29ed5f7200d8', '2026-01-07 13:57:33.132', '13:30', 2, 'Alergia a los frutos secos', 'María Invitado', 'invitado0@example.com', '+34 667862447', 'CONFIRMED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.142', '2026-01-02 13:57:33.142', 'cfaeae61-75a1-4a3e-b34c-46795146b9d6');
INSERT INTO public."Booking" VALUES ('366e1c5d-9c2b-41cc-bda6-766f101f44df', '2026-01-19 13:57:33.132', '13:30', 4, 'Alergia a los frutos secos', 'Javier Invitado', 'invitado1@example.com', '+34 1018320517', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.198', '2026-01-02 13:57:33.198', 'aa6d62fd-e3c1-44e2-a4a0-2256b48887fd');
INSERT INTO public."Booking" VALUES ('a8796b92-9179-49ea-9717-780509ae047a', '2025-12-10 13:57:33.132', '15:00', 4, NULL, 'Laura Invitado', 'invitado2@example.com', '+34 1264874398', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.235', '2026-01-02 13:57:33.235', '5f264000-4a93-4718-b5d9-3dce4dffe947');
INSERT INTO public."Booking" VALUES ('ea82387e-3e93-461c-9213-18b4a746e1f7', '2025-12-22 13:57:33.132', '12:00', 2, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado3@example.com', '+34 1357601931', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.257', '2026-01-02 13:57:33.257', 'fff8d93b-0f13-4185-8399-b2981fd32f18');
INSERT INTO public."Booking" VALUES ('0dad26af-f948-4ac4-abdb-31d8ce01a949', '2026-01-03 13:57:33.132', '13:30', 4, 'Alergia a los frutos secos', 'Laura Invitado', 'invitado4@example.com', '+34 1387205467', 'CONFIRMED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.287', '2026-01-02 13:57:33.287', 'c0b47a38-4c1d-4eb2-8809-2a2a46fca380');
INSERT INTO public."Booking" VALUES ('8e34ea2c-3245-4e93-ab7f-961eb198e583', '2026-01-10 13:57:33.132', '20:00', 4, NULL, 'David Invitado', 'invitado5@example.com', '+34 1449789773', 'PENDING', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', NULL, '2026-01-02 13:57:33.292', '2026-01-02 13:57:33.292', 'cd3746fb-9062-493c-97d2-a83c2c4ac137');
INSERT INTO public."Booking" VALUES ('0b220363-43f9-4922-aed3-46b8bdec27b1', '2026-01-12 13:57:33.132', '18:30', 2, 'Alergia a los frutos secos', 'Ana Martínez', 'ana.martinez@example.com', '+34 652935198', 'CONFIRMED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.308', '2026-01-02 13:57:33.308', '2f074522-b584-4c79-8e81-73a498851826');
INSERT INTO public."Booking" VALUES ('80ae9c88-4a92-45b2-bf55-69dd0e3c300b', '2025-12-24 13:57:33.132', '21:00', 6, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1288752849', 'COMPLETED', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:33.326', '2026-01-02 13:57:33.326', 'cd3746fb-9062-493c-97d2-a83c2c4ac137');
INSERT INTO public."Booking" VALUES ('c6da53c5-3ebc-4879-b6fa-ec96d35d7446', '2026-01-25 13:57:33.132', '13:30', 2, 'Alergia a los frutos secos', 'Miguel Invitado', 'invitado0@example.com', '+34 1326272374', 'PENDING', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-02 13:57:33.349', '2026-01-02 13:57:33.349', '421232b4-8ef9-4a5d-bb17-d4db8b8d26e7');
INSERT INTO public."Booking" VALUES ('5bfbe045-1969-40ae-90c8-c3a6a0e9d06f', '2025-12-09 13:57:33.132', '20:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 871248383', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.354', '2026-01-02 13:57:33.354', '421232b4-8ef9-4a5d-bb17-d4db8b8d26e7');
INSERT INTO public."Booking" VALUES ('e840b123-116f-456d-9e14-8f11a05211c2', '2025-12-15 13:57:33.132', '13:30', 4, 'Preferimos zona tranquila', 'Laura Invitado', 'invitado2@example.com', '+34 1088049056', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-02 13:57:33.359', '2026-01-02 13:57:33.359', '421232b4-8ef9-4a5d-bb17-d4db8b8d26e7');
INSERT INTO public."Booking" VALUES ('994be610-8709-47cb-8c7f-d8ced3e1f023', '2025-12-26 13:57:33.132', '15:00', 2, NULL, 'Miguel Invitado', 'invitado3@example.com', '+34 944973161', 'COMPLETED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', NULL, '2026-01-02 13:57:33.366', '2026-01-02 13:57:33.366', '3f8ef646-77ad-4c0a-b2b9-7f3c6db89177');
INSERT INTO public."Booking" VALUES ('6186379f-97e9-493f-a4f7-fc9e50059591', '2026-01-12 13:57:33.132', '20:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1226360780', 'CONFIRMED', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.372', '2026-01-02 13:57:33.372', 'efd3665b-9e2d-4be5-b5ab-e33547dfdf63');
INSERT INTO public."Booking" VALUES ('97a667bc-faf0-4907-bd99-4c65d58c150a', '2025-12-22 13:57:33.132', '13:00', 6, NULL, 'Carmen Invitado', 'invitado0@example.com', '+34 659428691', 'COMPLETED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-02 13:57:33.385', '2026-01-02 13:57:33.385', '90622cf1-cca2-4e32-8f13-57cf419fe349');
INSERT INTO public."Booking" VALUES ('1444a5e5-15dc-4d80-8274-a58534b76a49', '2026-01-20 13:57:33.132', '13:00', 6, NULL, 'Carmen Invitado', 'invitado1@example.com', '+34 843665294', 'CONFIRMED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-02 13:57:33.397', '2026-01-02 13:57:33.397', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('3e3f4890-116d-4e0f-ac26-3b37e236bf06', '2026-01-07 13:57:33.132', '16:30', 6, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1434974303', 'PENDING', '777d3d7b-eeef-4855-82ff-34ed99b572e5', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.424', '2026-01-02 13:57:33.424', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('80198929-f5c4-48eb-8b52-de6a78942607', '2026-01-12 13:57:33.132', '14:30', 6, NULL, 'Laura Invitado', 'invitado3@example.com', '+34 979742028', 'CONFIRMED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-02 13:57:33.438', '2026-01-02 13:57:33.438', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('3642cfbb-5aac-468e-8ec3-14ab23761e00', '2025-12-28 13:57:33.132', '20:00', 8, 'Silla de bebé necesaria', 'Javier Invitado', 'invitado4@example.com', '+34 706444582', 'CANCELLED', '777d3d7b-eeef-4855-82ff-34ed99b572e5', NULL, '2026-01-02 13:57:33.45', '2026-01-02 13:57:33.45', '4fcf88a4-86a3-4850-bb3c-e6317da7fb90');
INSERT INTO public."Booking" VALUES ('54db892b-f5f4-4ea6-8cbb-73fd67db2bf5', '2025-12-28 13:57:33.132', '18:30', 2, NULL, 'Carlos Invitado', 'invitado0@example.com', '+34 1105440970', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-02 13:57:33.465', '2026-01-02 13:57:33.465', 'ddd9979e-d823-4ab4-8dbc-98d094211bf1');
INSERT INTO public."Booking" VALUES ('cf35c741-d220-4578-b03e-32e408dd1f11', '2026-01-09 13:57:33.132', '12:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1250210284', 'PENDING', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:33.474', '2026-01-02 13:57:33.474', '1dff4493-2a32-4524-a496-0247865fd3a4');
INSERT INTO public."Booking" VALUES ('69ee35fb-7a1e-4600-a9df-4dab718ff7d6', '2025-12-11 13:57:33.132', '18:30', 6, 'Alergia a los frutos secos', 'María García', 'maria.garcia@example.com', '+34 1262839970', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:33.482', '2026-01-02 13:57:33.482', '68534514-901e-4f1e-9309-5a770056b078');
INSERT INTO public."Booking" VALUES ('2a1e9bff-2ea1-4c27-9098-93b071163973', '2025-12-23 13:57:33.132', '19:00', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 673469537', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:33.49', '2026-01-02 13:57:33.49', '2eaf8bb0-f42c-4bf5-8deb-cfa376a76a3f');
INSERT INTO public."Booking" VALUES ('2ce66c56-0358-487a-827d-c7dff193ac15', '2025-12-14 13:57:33.132', '16:30', 2, 'Silla de bebé necesaria', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1186034899', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:33.497', '2026-01-02 13:57:33.497', '1dff4493-2a32-4524-a496-0247865fd3a4');
INSERT INTO public."Booking" VALUES ('99997f8d-334d-4eb1-a20b-9b862376c471', '2025-12-31 13:57:33.132', '19:30', 2, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 1030702562', 'CONFIRMED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-02 13:57:33.505', '2026-01-02 13:57:33.505', '2ba650ac-ac76-4180-8e98-548f40dfae44');
INSERT INTO public."Booking" VALUES ('abb4e3bb-cdf0-4fbe-955e-1c46ac466b89', '2025-12-29 13:57:33.132', '16:30', 2, 'Cumpleaños, ¿tienen tarta?', 'Carlos Invitado', 'invitado9@example.com', '+34 1075674168', 'COMPLETED', '3da8e4f3-21c8-48e5-9af8-50a930803e78', NULL, '2026-01-02 13:57:33.519', '2026-01-02 13:57:33.519', '2ba650ac-ac76-4180-8e98-548f40dfae44');
INSERT INTO public."Booking" VALUES ('730566e6-9769-41f8-978b-845d99febec8', '2026-01-27 13:57:33.132', '19:00', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1118123631', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.527', '2026-01-02 13:57:33.527', '5d4aa0ee-0ae0-4cc3-812b-09f9f865b98d');
INSERT INTO public."Booking" VALUES ('4c300628-9011-4b8c-9d79-b83904738b54', '2026-01-02 13:57:33.132', '21:30', 2, NULL, 'María Invitado', 'invitado1@example.com', '+34 1030766741', 'CONFIRMED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-02 13:57:33.535', '2026-01-02 13:57:33.535', 'a1333a49-9f88-4cd5-8df2-64a9be1161cf');
INSERT INTO public."Booking" VALUES ('80d737d8-88a5-4604-8b5d-85ef1fbc68a6', '2025-12-05 13:57:33.132', '13:00', 4, 'Preferimos zona tranquila', 'Carlos López', 'carlos.lopez@example.com', '+34 1038372496', 'COMPLETED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.54', '2026-01-02 13:57:33.54', 'ee2996f6-0295-498b-882b-ac4983d83afe');
INSERT INTO public."Booking" VALUES ('23769b8c-b1c8-4da4-ac71-171e1f9825b8', '2025-12-25 13:57:33.132', '19:30', 4, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 722213889', 'COMPLETED', '853c16e3-6906-4985-afad-211880a60917', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:33.548', '2026-01-02 13:57:33.548', '3e41b965-557f-4d5b-bc32-ec5a1c06582a');
INSERT INTO public."Booking" VALUES ('9ab4be67-9298-47f1-bb07-3ca68e6417de', '2025-12-05 13:57:33.132', '14:00', 4, NULL, 'Carlos Invitado', 'invitado4@example.com', '+34 600987135', 'COMPLETED', '853c16e3-6906-4985-afad-211880a60917', NULL, '2026-01-02 13:57:33.559', '2026-01-02 13:57:33.559', '2744de37-02d8-4faf-aa00-5bbc971cd909');
INSERT INTO public."Booking" VALUES ('2beb0199-7c6b-4d69-8702-7c4e8343a8c1', '2025-12-19 13:57:33.132', '12:00', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 833069216', 'COMPLETED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.569', '2026-01-02 13:57:33.569', '50397fd4-f669-4cd5-a5f2-af2fb7665faa');
INSERT INTO public."Booking" VALUES ('7d8c76ed-e8f7-499e-aad4-2f647d2521f5', '2026-01-24 13:57:33.132', '20:00', 6, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1248624005', 'PENDING', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.574', '2026-01-02 13:57:33.574', '19e2dce5-66d5-4418-87ad-4526decf1293');
INSERT INTO public."Booking" VALUES ('8a033b1f-2b27-4813-8463-8f41c7e8f2d3', '2025-12-31 13:57:33.132', '13:30', 8, NULL, 'María Invitado', 'invitado2@example.com', '+34 874525785', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-02 13:57:33.581', '2026-01-02 13:57:33.581', '6ea1a9ec-baa7-4918-a590-e110a90e392a');
INSERT INTO public."Booking" VALUES ('c5182cba-dbd6-4759-8907-5f3744b9efe5', '2025-12-08 13:57:33.132', '14:30', 2, 'Alergia a los frutos secos', 'Javier Invitado', 'invitado3@example.com', '+34 814647216', 'COMPLETED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-02 13:57:33.59', '2026-01-02 13:57:33.59', '6f479fb9-5b31-4ae9-8e19-1087cf6baa9c');
INSERT INTO public."Booking" VALUES ('b3281a6e-8db1-4d38-8235-a915e6c908d8', '2025-12-07 13:57:33.132', '17:30', 4, NULL, 'Ana Invitado', 'invitado4@example.com', '+34 744792175', 'COMPLETED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-02 13:57:33.599', '2026-01-02 13:57:33.599', '26623647-18aa-4373-9299-541f0e36673e');
INSERT INTO public."Booking" VALUES ('cf86febb-efe2-42d0-8225-cfd8351cb713', '2026-01-01 13:57:33.132', '18:00', 2, NULL, 'Ana Invitado', 'invitado5@example.com', '+34 1131042734', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-02 13:57:33.603', '2026-01-02 13:57:33.603', 'd15df445-1987-4f82-a9c8-3dc2f4ae2afc');
INSERT INTO public."Booking" VALUES ('59c51a50-f659-47fb-9e0a-347ed0e7a271', '2025-12-22 13:57:33.132', '18:00', 2, NULL, 'Miguel Invitado', 'invitado0@example.com', '+34 1383165335', 'CANCELLED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-02 13:57:33.67', '2026-01-02 13:57:33.67', '292972f8-43be-48eb-a028-d469c33fe6dd');
INSERT INTO public."Booking" VALUES ('e35a68ea-0dce-4e34-8bb9-760c75b22cb8', '2026-01-14 13:57:33.132', '15:00', 2, 'Alergia a los frutos secos', 'Carlos López', 'carlos.lopez@example.com', '+34 1088324537', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.686', '2026-01-02 13:57:33.686', 'de1b90f7-f6b4-4990-9128-c7e829e13b70');
INSERT INTO public."Booking" VALUES ('d80a9e3b-5a89-4dc0-9ea5-31c1f82c951e', '2026-01-11 13:57:33.132', '12:30', 4, NULL, 'Ana Invitado', 'invitado2@example.com', '+34 1070982269', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-02 13:57:33.693', '2026-01-02 13:57:33.693', 'c1d59fd6-27fb-4321-be0e-6fec03eb3e7a');
INSERT INTO public."Booking" VALUES ('8aab1700-1d77-40df-a3e2-474c0df88a38', '2026-01-25 13:57:33.132', '15:30', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1136326663', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.717', '2026-01-02 13:57:33.717', '292972f8-43be-48eb-a028-d469c33fe6dd');
INSERT INTO public."Booking" VALUES ('e463979c-ea69-4033-a8aa-306af951b8bd', '2026-01-08 13:57:33.132', '13:30', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 745827047', 'PENDING', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:33.727', '2026-01-02 13:57:33.727', 'de1b90f7-f6b4-4990-9128-c7e829e13b70');
INSERT INTO public."Booking" VALUES ('71573d81-fece-45b9-ab32-c5aef5824914', '2025-12-10 13:57:33.132', '20:30', 4, 'Cumpleaños, ¿tienen tarta?', 'Javier Invitado', 'invitado5@example.com', '+34 977761451', 'COMPLETED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-02 13:57:33.744', '2026-01-02 13:57:33.744', '543b13f3-2296-48a6-9f85-8b2c42defbc9');
INSERT INTO public."Booking" VALUES ('7eae82f2-1e7c-430b-a692-98dbb4429907', '2026-01-20 13:57:33.132', '19:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 603792320', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:33.752', '2026-01-02 13:57:33.752', '292972f8-43be-48eb-a028-d469c33fe6dd');
INSERT INTO public."Booking" VALUES ('79dc790b-c22f-4af5-b56a-6707d271b27d', '2025-12-17 13:57:33.132', '20:30', 4, 'Mesa cerca de la ventana por favor', 'Ana Invitado', 'invitado7@example.com', '+34 766225750', 'COMPLETED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', NULL, '2026-01-02 13:57:33.758', '2026-01-02 13:57:33.758', '543b13f3-2296-48a6-9f85-8b2c42defbc9');
INSERT INTO public."Booking" VALUES ('f355e343-086f-4005-8531-e016b2a24848', '2026-01-12 13:57:33.132', '20:30', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 997330534', 'CONFIRMED', 'ccb963c9-0da1-4961-8e96-98a60d9c5747', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.766', '2026-01-02 13:57:33.766', '80b7d6aa-5afb-40f1-90cd-34d70948c26c');
INSERT INTO public."Booking" VALUES ('08f14427-b9ba-410d-b1a1-dceef5417448', '2025-12-31 13:57:33.132', '15:30', 2, 'Cumpleaños, ¿tienen tarta?', 'David Rodríguez', 'david.rodriguez@example.com', '+34 1313096192', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:33.781', '2026-01-02 13:57:33.781', 'ada903c3-5218-4693-8194-419ddd1f89ac');
INSERT INTO public."Booking" VALUES ('6922828e-40db-46d7-9151-a5e74b55a603', '2026-01-11 13:57:33.132', '19:00', 4, NULL, 'Javier Invitado', 'invitado1@example.com', '+34 1203380420', 'PENDING', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-02 13:57:33.794', '2026-01-02 13:57:33.794', '0e2a14eb-4ce6-4549-9714-e8c43ba2dd99');
INSERT INTO public."Booking" VALUES ('061ff29e-1d12-425c-a829-d8c748bdf9c7', '2025-12-14 13:57:33.132', '13:30', 4, 'Preferimos zona tranquila', 'Laura Fernández', 'laura.fernandez@example.com', '+34 975853421', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:33.801', '2026-01-02 13:57:33.801', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('ea99a6af-d8d8-4ba4-a843-46b2450a1ad9', '2025-12-20 13:57:33.132', '16:00', 4, 'Alergia a los frutos secos', 'David Rodríguez', 'david.rodriguez@example.com', '+34 1417287115', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:33.817', '2026-01-02 13:57:33.817', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('f0b809be-7c47-491f-b871-63451d8d6a45', '2026-01-17 13:57:33.132', '14:00', 4, NULL, 'Ana Invitado', 'invitado4@example.com', '+34 1306318575', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-02 13:57:33.83', '2026-01-02 13:57:33.83', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('e218ec11-e582-4f13-9502-41fa71c316ab', '2025-12-18 13:57:33.132', '19:00', 4, 'Alergia a los frutos secos', 'Carlos Invitado', 'invitado5@example.com', '+34 1105866592', 'CANCELLED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-02 13:57:33.834', '2026-01-02 13:57:33.834', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('1533cc40-0ffa-46b3-af48-c48adc854884', '2026-01-19 13:57:33.132', '18:00', 4, NULL, 'María Invitado', 'invitado6@example.com', '+34 1398052916', 'CONFIRMED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-02 13:57:33.839', '2026-01-02 13:57:33.839', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('66f21548-c79c-4a62-93b3-93cf5dc4b2cd', '2025-12-19 13:57:33.132', '21:30', 2, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1057080283', 'CANCELLED', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:33.844', '2026-01-02 13:57:33.844', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('f1403cb1-66f1-45e6-bdce-edd2ed1e84f5', '2025-12-19 13:57:33.132', '20:30', 2, 'Cumpleaños, ¿tienen tarta?', 'Carlos Invitado', 'invitado8@example.com', '+34 716046520', 'COMPLETED', '3442a830-784d-4344-a5ec-96653a1b7212', NULL, '2026-01-02 13:57:33.851', '2026-01-02 13:57:33.851', 'b2ca6a30-b092-43b9-b2b4-6572d68f3333');
INSERT INTO public."Booking" VALUES ('b6e1bded-485b-47c8-a369-44f774b7d594', '2026-01-02 13:57:33.132', '14:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1365199562', 'PENDING', '3442a830-784d-4344-a5ec-96653a1b7212', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:33.855', '2026-01-02 13:57:33.855', '17ac494a-088a-4c18-8333-3f09ed59419c');
INSERT INTO public."Booking" VALUES ('ce9a30b4-2c25-40a6-96b8-04d8edab556d', '2025-12-08 13:57:33.132', '16:00', 4, 'Preferimos zona tranquila', 'Javier Invitado', 'invitado0@example.com', '+34 1098178666', 'COMPLETED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-02 13:57:33.864', '2026-01-02 13:57:33.864', '92170c27-580b-42fc-ab47-b9a6c4fa263a');
INSERT INTO public."Booking" VALUES ('5f43ad75-8040-4a2c-8045-83ea8d774559', '2026-01-21 13:57:33.132', '21:30', 6, NULL, 'Miguel Invitado', 'invitado1@example.com', '+34 1376311289', 'CONFIRMED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-02 13:57:33.87', '2026-01-02 13:57:33.87', '3dc196c2-23a4-4d02-bfe6-5274176c6b91');
INSERT INTO public."Booking" VALUES ('35ed36e8-174a-4c82-992b-faf66035e81b', '2025-12-04 13:57:33.132', '21:00', 8, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1312276063', 'COMPLETED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:33.875', '2026-01-02 13:57:33.875', '9f96e76f-1450-4b2e-a3d4-a48de23aa7c2');
INSERT INTO public."Booking" VALUES ('0820aacd-4472-400e-b5b0-d17c097c04bb', '2025-12-31 13:57:33.132', '19:30', 2, NULL, 'Ana Invitado', 'invitado3@example.com', '+34 1074786170', 'PENDING', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-02 13:57:33.882', '2026-01-02 13:57:33.882', '74eb42d1-4372-47c4-a0b1-3579be3e356a');
INSERT INTO public."Booking" VALUES ('e84eba85-0d3a-45b0-aa94-ad236e9ad443', '2025-12-14 13:57:33.132', '13:30', 6, NULL, 'David Invitado', 'invitado4@example.com', '+34 1366850792', 'CANCELLED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', NULL, '2026-01-02 13:57:33.907', '2026-01-02 13:57:33.907', '92170c27-580b-42fc-ab47-b9a6c4fa263a');
INSERT INTO public."Booking" VALUES ('dbded719-dfca-4fec-a1df-0565560e27a4', '2025-12-07 13:57:33.132', '14:30', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 766487280', 'COMPLETED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:33.913', '2026-01-02 13:57:33.913', '92170c27-580b-42fc-ab47-b9a6c4fa263a');
INSERT INTO public."Booking" VALUES ('e65409a0-e7bf-46c5-87f7-1b8559e7ca8f', '2026-01-15 13:57:33.132', '12:00', 4, 'Alergia a los frutos secos', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1082666401', 'CONFIRMED', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:33.917', '2026-01-02 13:57:33.917', '74eb42d1-4372-47c4-a0b1-3579be3e356a');
INSERT INTO public."Booking" VALUES ('ac377c50-bb7a-41bf-ab18-d6adfe109304', '2025-12-27 13:57:33.132', '17:30', 2, NULL, 'María Invitado', 'invitado0@example.com', '+34 1057947318', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-02 13:57:33.948', '2026-01-02 13:57:33.948', '859ca1b7-3a17-43a7-a300-660fc084f918');
INSERT INTO public."Booking" VALUES ('c71bce2c-340e-4958-83a2-1c097f0e72f7', '2025-12-10 13:57:33.132', '16:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1371838033', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:33.953', '2026-01-02 13:57:33.953', '51342893-2162-4fde-96e1-7c4028f50e6c');
INSERT INTO public."Booking" VALUES ('b939b622-4571-408e-b295-7f8f216568d4', '2026-01-06 13:57:33.132', '16:30', 8, 'Silla de bebé necesaria', 'Carlos Invitado', 'invitado2@example.com', '+34 1038975380', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-02 13:57:33.966', '2026-01-02 13:57:33.966', '91a3855f-3a2f-421c-8fef-b481f85c6859');
INSERT INTO public."Booking" VALUES ('86e1cccf-2241-4b1f-ad70-2df18977aafc', '2025-12-19 13:57:33.132', '16:30', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1222906939', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:33.97', '2026-01-02 13:57:33.97', '859ca1b7-3a17-43a7-a300-660fc084f918');
INSERT INTO public."Booking" VALUES ('63d006ca-9ace-43e7-875a-8dbce92bef7c', '2025-12-29 13:57:33.132', '19:00', 8, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 930961105', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:33.977', '2026-01-02 13:57:33.977', '3e6d3ff9-3fba-4098-bde6-7b0365e4385c');
INSERT INTO public."Booking" VALUES ('4c696b2a-42a9-4f85-9824-6a9079f428d7', '2026-01-27 13:57:33.132', '20:30', 4, NULL, 'Carmen Invitado', 'invitado5@example.com', '+34 911725194', 'CONFIRMED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-02 13:57:33.987', '2026-01-02 13:57:33.987', '858b1ba7-209e-4703-b241-de2ba1dc9f5e');
INSERT INTO public."Booking" VALUES ('b1fec0de-18be-4d93-a3d1-6e214d63cf7d', '2026-01-29 13:57:33.132', '21:30', 8, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 886486561', 'CONFIRMED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:33.999', '2026-01-02 13:57:33.999', '91a3855f-3a2f-421c-8fef-b481f85c6859');
INSERT INTO public."Booking" VALUES ('507c6b9a-063a-4ad5-9dc9-a6965ced26cb', '2026-01-17 13:57:33.132', '15:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1383853301', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.019', '2026-01-02 13:57:34.019', 'fc1a7639-aa73-40b3-9b14-323ef6538de9');
INSERT INTO public."Booking" VALUES ('920d0120-fac3-4b65-883d-2667123b94ff', '2025-12-30 13:57:33.132', '14:00', 4, NULL, 'Ana Invitado', 'invitado8@example.com', '+34 780370122', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-02 13:57:34.027', '2026-01-02 13:57:34.027', 'c7d80be7-2ebc-4c57-a352-141156a77801');
INSERT INTO public."Booking" VALUES ('a379e7f7-fc6a-43b2-80dd-be59ddce0d4e', '2025-12-17 13:57:33.132', '14:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1433086445', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.035', '2026-01-02 13:57:34.035', 'a527c49f-8ee3-4dfd-912a-f39cb3f2dbf6');
INSERT INTO public."Booking" VALUES ('8473dd79-4633-41f3-b757-b11d4a876030', '2026-01-27 13:57:33.132', '16:00', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 657072102', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:34.041', '2026-01-02 13:57:34.041', '51342893-2162-4fde-96e1-7c4028f50e6c');
INSERT INTO public."Booking" VALUES ('33b5962d-fc02-4a46-8d5b-06df1f393e01', '2025-12-30 13:57:33.132', '21:00', 8, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1456769590', 'COMPLETED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:34.05', '2026-01-02 13:57:34.05', '91a3855f-3a2f-421c-8fef-b481f85c6859');
INSERT INTO public."Booking" VALUES ('1e4ea4cc-126f-4620-9a6d-38b65cc38ff2', '2026-01-24 13:57:33.132', '15:30', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 922750464', 'CONFIRMED', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.057', '2026-01-02 13:57:34.057', 'c7d80be7-2ebc-4c57-a352-141156a77801');
INSERT INTO public."Booking" VALUES ('40e92afe-4c31-4c7f-b23d-8cb64178b4c9', '2026-01-27 13:57:33.132', '15:00', 4, NULL, 'Carlos Invitado', 'invitado13@example.com', '+34 1399429368', 'PENDING', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d', NULL, '2026-01-02 13:57:34.073', '2026-01-02 13:57:34.073', '8ff401b6-f65d-49fc-b81a-7562d47e4e17');
INSERT INTO public."Booking" VALUES ('237e3f6f-e461-42ce-ac86-c37fc80ec8ab', '2026-01-09 13:57:33.132', '19:30', 2, 'Alergia a los frutos secos', 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1090736307', 'CONFIRMED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:34.092', '2026-01-02 13:57:34.092', '3b1d0a7f-a211-4a86-b37f-1e87da41523a');
INSERT INTO public."Booking" VALUES ('b08b4e14-737a-41cf-a52f-51d6783d1c2f', '2025-12-30 13:57:33.132', '21:00', 8, NULL, 'Carlos Invitado', 'invitado1@example.com', '+34 951011426', 'CANCELLED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-02 13:57:34.102', '2026-01-02 13:57:34.102', '4fcf92ef-3b41-4967-a400-71a9549e9360');
INSERT INTO public."Booking" VALUES ('21aa084b-4739-4d04-b009-3b874ba5c51c', '2025-12-27 13:57:33.132', '12:00', 6, NULL, 'David Invitado', 'invitado2@example.com', '+34 1486834194', 'COMPLETED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-02 13:57:34.132', '2026-01-02 13:57:34.132', 'a6c00fd5-fedb-46e7-9d63-e2da94f9afc9');
INSERT INTO public."Booking" VALUES ('d33071de-a427-4f86-b3a9-e70b510d662d', '2026-01-11 13:57:33.132', '15:00', 4, 'Alergia a los frutos secos', 'Ana Invitado', 'invitado3@example.com', '+34 833164753', 'PENDING', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-02 13:57:34.136', '2026-01-02 13:57:34.136', 'c9b1fedd-f2eb-4b60-a29f-d1f63140173a');
INSERT INTO public."Booking" VALUES ('2143edcc-06c3-48ea-a817-8608bf5a5d57', '2025-12-09 13:57:33.132', '17:00', 2, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado4@example.com', '+34 1365340691', 'COMPLETED', '551b0921-a0e1-479f-94b6-949f91ec7fcf', NULL, '2026-01-02 13:57:34.148', '2026-01-02 13:57:34.148', 'f623b8f4-1235-4730-bccf-4c4a0683042c');
INSERT INTO public."Booking" VALUES ('5c253774-561d-4c11-b624-9a144bc4d590', '2025-12-08 13:57:33.132', '21:00', 2, NULL, 'Miguel Invitado', 'invitado0@example.com', '+34 869971865', 'COMPLETED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', NULL, '2026-01-02 13:57:34.166', '2026-01-02 13:57:34.166', '2c176625-d989-41c4-ade1-d87d090b8b26');
INSERT INTO public."Booking" VALUES ('77381a2e-8671-4c9e-8c39-9fce91a82ee3', '2026-01-20 13:57:33.132', '21:00', 8, 'Silla de bebé necesaria', 'Miguel Invitado', 'invitado1@example.com', '+34 1246346464', 'CONFIRMED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', NULL, '2026-01-02 13:57:34.18', '2026-01-02 13:57:34.18', '3d49573d-f86e-45fb-82c3-56bd8cb790ae');
INSERT INTO public."Booking" VALUES ('acd40a93-e555-48f5-8d51-0daaf798923a', '2025-12-11 13:57:33.132', '17:00', 8, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1361988604', 'COMPLETED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:34.211', '2026-01-02 13:57:34.211', '3d49573d-f86e-45fb-82c3-56bd8cb790ae');
INSERT INTO public."Booking" VALUES ('637754d6-25db-411a-b237-18761180a1b1', '2026-01-26 13:57:33.132', '19:00', 2, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1474193993', 'CONFIRMED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:34.221', '2026-01-02 13:57:34.221', '50d8b8e9-7b87-4f4c-8c38-2a6c6cdeb19e');
INSERT INTO public."Booking" VALUES ('3e1edd11-970a-47f4-bf28-70317842538c', '2025-12-17 13:57:33.132', '17:30', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1384238334', 'COMPLETED', 'a839c8d2-2a02-40e2-920b-c43c9cda0394', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:34.237', '2026-01-02 13:57:34.237', '591d0138-7648-42d0-8989-05dda0d7193c');
INSERT INTO public."Booking" VALUES ('a62088ef-a080-41ef-9800-878ad2564609', '2025-12-27 13:57:33.132', '18:30', 4, NULL, 'Ana Invitado', 'invitado0@example.com', '+34 1357743844', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-02 13:57:34.268', '2026-01-02 13:57:34.268', '6f252668-41e7-4aef-8204-6d7bfebd64d9');
INSERT INTO public."Booking" VALUES ('9d76115b-700c-4099-b6fe-9e11834f0b2b', '2025-12-19 13:57:33.132', '21:30', 6, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1309720248', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:34.285', '2026-01-02 13:57:34.285', '92e300ca-2765-4125-88e3-9974dcd8c431');
INSERT INTO public."Booking" VALUES ('0f62a7eb-9591-4909-981f-b7829e02c7fa', '2025-12-24 13:57:33.132', '17:00', 2, NULL, 'María Invitado', 'invitado2@example.com', '+34 614234285', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', NULL, '2026-01-02 13:57:34.3', '2026-01-02 13:57:34.3', '9d4456bb-fca1-4185-b8ff-7ce3b4fb4300');
INSERT INTO public."Booking" VALUES ('de90f278-90be-4f41-a311-f2a06c0ea752', '2025-12-24 13:57:33.132', '19:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Carlos López', 'carlos.lopez@example.com', '+34 716501284', 'CANCELLED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:34.321', '2026-01-02 13:57:34.321', 'fd655450-fb8f-4aa6-9a54-840e65e6a114');
INSERT INTO public."Booking" VALUES ('6ebbe5ee-3df4-4556-9b31-a77dc270e449', '2026-01-10 13:57:33.132', '20:00', 2, 'Preferimos zona tranquila', 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1256844287', 'PENDING', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:34.35', '2026-01-02 13:57:34.35', '4b17464f-f192-4c58-a3ed-ad81b90e37ff');
INSERT INTO public."Booking" VALUES ('a807b90a-3d6f-4b56-9ad7-bd6332a95d43', '2025-12-03 13:57:33.132', '14:30', 6, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1362476930', 'COMPLETED', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:34.361', '2026-01-02 13:57:34.361', '86d4dc65-1b44-4fee-8526-8a0a91b1bb75');
INSERT INTO public."Booking" VALUES ('14879fb3-dc89-4d9e-b97a-a3886dbdcb20', '2025-12-04 13:57:33.132', '12:00', 2, NULL, 'Javier Invitado', 'invitado0@example.com', '+34 1119645700', 'CANCELLED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-02 13:57:34.392', '2026-01-02 13:57:34.392', '331389bd-ad4d-489e-9725-36a8204bfc20');
INSERT INTO public."Booking" VALUES ('467a3819-7196-4078-9087-962117bb66c3', '2025-12-26 13:57:33.132', '18:30', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1193119530', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:34.438', '2026-01-02 13:57:34.438', '0e5bf2a6-94ee-4ed1-86d8-bf6d9dff97de');
INSERT INTO public."Booking" VALUES ('fdd729b6-1b2e-46f5-b32c-aa691d79b54b', '2025-12-16 13:57:33.132', '14:00', 4, NULL, 'Laura Invitado', 'invitado2@example.com', '+34 902735273', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-02 13:57:34.449', '2026-01-02 13:57:34.449', '5cfe0a52-1632-4862-85cc-f4f2309a1f73');
INSERT INTO public."Booking" VALUES ('7d42cbe7-868d-4e4c-b9e1-f2da5b1a2707', '2026-01-08 13:57:33.132', '16:00', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 611751512', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:34.459', '2026-01-02 13:57:34.459', '5cfe0a52-1632-4862-85cc-f4f2309a1f73');
INSERT INTO public."Booking" VALUES ('a9c4a314-9fe0-416c-9900-571506d87c7d', '2025-12-29 13:57:33.132', '12:00', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 945378907', 'CANCELLED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:34.472', '2026-01-02 13:57:34.472', '5cfe0a52-1632-4862-85cc-f4f2309a1f73');
INSERT INTO public."Booking" VALUES ('9005873f-cf39-4efb-a1f9-53838e33fa9f', '2026-01-12 13:57:33.132', '12:30', 2, 'Mesa cerca de la ventana por favor', 'Ana Martínez', 'ana.martinez@example.com', '+34 1355681690', 'PENDING', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:34.488', '2026-01-02 13:57:34.488', 'ed85f38c-0ec1-4ddb-b381-c92fe46d2efe');
INSERT INTO public."Booking" VALUES ('4e5e0e30-d105-4885-81c3-5a401f88246f', '2026-01-12 13:57:33.132', '21:00', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1453503421', 'CONFIRMED', 'b74c8030-7571-417a-9b97-e82b80b500a6', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:34.516', '2026-01-02 13:57:34.516', '331389bd-ad4d-489e-9725-36a8204bfc20');
INSERT INTO public."Booking" VALUES ('43a90b72-fe4a-481f-995a-4ecd3592f718', '2025-12-16 13:57:33.132', '21:30', 4, 'Mesa cerca de la ventana por favor', 'Carmen Invitado', 'invitado7@example.com', '+34 902708319', 'COMPLETED', 'b74c8030-7571-417a-9b97-e82b80b500a6', NULL, '2026-01-02 13:57:34.534', '2026-01-02 13:57:34.534', 'fc0b802e-6cb5-4eed-b27a-51d7c422ce6a');
INSERT INTO public."Booking" VALUES ('f2545d3e-3e92-490e-921b-fabd4b555062', '2025-12-11 13:57:33.132', '16:00', 4, NULL, 'Ana Invitado', 'invitado0@example.com', '+34 947912104', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-02 13:57:34.57', '2026-01-02 13:57:34.57', '71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b');
INSERT INTO public."Booking" VALUES ('2b64bd0b-c772-4970-a7a1-a040403ed703', '2025-12-18 13:57:33.132', '20:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1271517152', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:34.634', '2026-01-02 13:57:34.634', '14074581-d3f6-4ad3-91c8-620281048a03');
INSERT INTO public."Booking" VALUES ('e32f18b6-a523-471d-9a16-800b7c18175f', '2025-12-29 13:57:33.132', '17:30', 6, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 903911422', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.66', '2026-01-02 13:57:34.66', '71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b');
INSERT INTO public."Booking" VALUES ('b5400311-1d60-4d8f-b79e-ae88f3a4efe3', '2026-01-18 13:57:33.132', '17:00', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 733212167', 'CONFIRMED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:34.685', '2026-01-02 13:57:34.685', '469389db-14f9-4235-a6e4-478e1c0d4d92');
INSERT INTO public."Booking" VALUES ('7b80bd90-b7ff-4bf2-98da-b2b21a4419af', '2025-12-20 13:57:33.132', '14:30', 2, NULL, 'Carlos Invitado', 'invitado4@example.com', '+34 1046005487', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-02 13:57:34.716', '2026-01-02 13:57:34.716', '66bbd22c-ac5e-4f84-914a-4b408a95613f');
INSERT INTO public."Booking" VALUES ('385ba72f-1058-430a-94eb-8c71802c5eb7', '2026-01-07 13:57:33.132', '14:00', 4, NULL, 'Carlos Invitado', 'invitado5@example.com', '+34 1336412707', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-02 13:57:34.723', '2026-01-02 13:57:34.723', 'fc99e8b2-9ce4-43b9-b9a7-a7134eabd7bf');
INSERT INTO public."Booking" VALUES ('6a82cf75-6048-479b-bd78-54aba3d62a4a', '2026-01-25 13:57:33.132', '21:30', 2, NULL, 'María Invitado', 'invitado6@example.com', '+34 1048768701', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-02 13:57:34.732', '2026-01-02 13:57:34.732', '032a391e-0f7d-401f-84fc-0a8192ae6b2a');
INSERT INTO public."Booking" VALUES ('cce076ff-4e08-47c7-9a75-87df9f4d9a3a', '2025-12-04 13:57:33.132', '12:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 911217824', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.739', '2026-01-02 13:57:34.739', '14074581-d3f6-4ad3-91c8-620281048a03');
INSERT INTO public."Booking" VALUES ('1d7ed0c0-ec4a-4845-a9b3-983d7e00c6c8', '2025-12-17 13:57:33.132', '12:30', 6, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 996082254', 'CANCELLED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:34.767', '2026-01-02 13:57:34.767', '71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b');
INSERT INTO public."Booking" VALUES ('c6b46a7d-b66a-4602-b363-52641a6d69f3', '2026-01-02 13:57:33.132', '21:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1038508212', 'PENDING', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.789', '2026-01-02 13:57:34.789', '66bbd22c-ac5e-4f84-914a-4b408a95613f');
INSERT INTO public."Booking" VALUES ('7727374d-aacf-4db1-b398-777a100a4843', '2026-01-04 13:57:33.132', '12:30', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1407863535', 'CONFIRMED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:34.802', '2026-01-02 13:57:34.802', '469389db-14f9-4235-a6e4-478e1c0d4d92');
INSERT INTO public."Booking" VALUES ('bceabae3-a3a2-4734-bb14-a35c1e3198be', '2025-12-05 13:57:33.132', '21:30', 4, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 710131279', 'COMPLETED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:34.817', '2026-01-02 13:57:34.817', '71e4c03a-ab4a-47cc-aa62-6c7df6b96b7b');
INSERT INTO public."Booking" VALUES ('4c8c8d3e-65ad-4d5e-bc50-bcc3295896d2', '2026-01-28 13:57:33.132', '21:00', 8, NULL, 'Laura Invitado', 'invitado12@example.com', '+34 1447652669', 'CONFIRMED', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9', NULL, '2026-01-02 13:57:34.825', '2026-01-02 13:57:34.825', 'ac8956b8-1e45-41d0-b633-40b124a23143');
INSERT INTO public."Booking" VALUES ('f504685e-cd29-425e-a51e-3a975f6494c3', '2026-01-24 13:57:33.132', '14:00', 2, 'Preferimos zona tranquila', 'David Rodríguez', 'david.rodriguez@example.com', '+34 1492076606', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:34.835', '2026-01-02 13:57:34.835', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('d410f32b-88a4-47bd-8fd3-93c11ad7a352', '2025-12-18 13:57:33.132', '20:30', 4, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 833308610', 'COMPLETED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:34.843', '2026-01-02 13:57:34.843', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('b78de0d9-3024-448a-8d60-0d3f4945bfe1', '2026-01-07 13:57:33.132', '15:30', 2, NULL, 'Ana Invitado', 'invitado2@example.com', '+34 947898998', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-02 13:57:34.851', '2026-01-02 13:57:34.851', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('e4e0d382-10e4-430c-828a-ef55ddedfc3b', '2026-01-10 13:57:33.132', '19:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 915653515', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:34.857', '2026-01-02 13:57:34.857', '45de265a-6b21-432d-930c-a9e8cf50fc76');
INSERT INTO public."Booking" VALUES ('a17336b8-55ba-4a4b-aaf8-01b276a3a876', '2026-01-27 13:57:33.132', '21:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Javier Sánchez', 'javier.sanchez@example.com', '+34 816147508', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:34.867', '2026-01-02 13:57:34.867', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('a685cdd1-ae78-4be2-9117-69a868f3e8ae', '2026-01-02 13:57:33.132', '18:00', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1368043015', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:34.876', '2026-01-02 13:57:34.876', '0cd0212e-d4f1-4283-bf27-f4427dde3151');
INSERT INTO public."Booking" VALUES ('7082523a-712e-491e-8cd0-743dda9991d1', '2026-01-29 13:57:33.132', '20:30', 6, 'Alergia a los frutos secos', 'Javier Invitado', 'invitado6@example.com', '+34 609246764', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-02 13:57:34.9', '2026-01-02 13:57:34.9', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('5a49311f-0b0e-4f46-83d7-6dbc530f8c54', '2025-12-08 13:57:33.132', '17:30', 2, NULL, 'Carmen Invitado', 'invitado7@example.com', '+34 743411412', 'CANCELLED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', NULL, '2026-01-02 13:57:34.905', '2026-01-02 13:57:34.905', 'c0533e7b-5004-4110-83a9-65f412e2208a');
INSERT INTO public."Booking" VALUES ('006598bd-0785-4163-a4a7-a37ca1f757ef', '2025-12-22 13:57:33.132', '15:00', 8, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1258482244', 'COMPLETED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:34.914', '2026-01-02 13:57:34.914', '152d7ab8-d71f-4543-b3ee-a7a987f51798');
INSERT INTO public."Booking" VALUES ('b6b6fcb4-bce4-4e28-a5e0-372f8a60ae4e', '2026-01-19 13:57:33.132', '12:30', 2, NULL, 'Javier Invitado', 'invitado0@example.com', '+34 1314871096', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-02 13:57:34.921', '2026-01-02 13:57:34.921', '88063b12-43cc-425f-a15c-46993b5d2feb');
INSERT INTO public."Booking" VALUES ('e3fd0fd6-1205-4f05-9749-b495537771c9', '2026-01-06 13:57:33.132', '12:30', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 689314955', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:34.926', '2026-01-02 13:57:34.926', '2d5ab711-3146-497e-b294-c3132c7f1868');
INSERT INTO public."Booking" VALUES ('210c33bb-69a3-45b8-87a6-b12944a046f5', '2025-12-05 13:57:33.132', '18:00', 6, NULL, 'María García', 'maria.garcia@example.com', '+34 1131215239', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:34.933', '2026-01-02 13:57:34.933', '57e68a8a-44ff-4633-ad1d-d1658511ce25');
INSERT INTO public."Booking" VALUES ('23262e38-c1df-4533-b72a-04ca589eda86', '2025-12-25 13:57:33.132', '15:30', 4, 'Cumpleaños, ¿tienen tarta?', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1229818393', 'CANCELLED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:34.947', '2026-01-02 13:57:34.947', '182f212d-5b04-4ed4-bbb1-5c62cb0f5bfe');
INSERT INTO public."Booking" VALUES ('ee40d408-fd28-4c02-b532-08b9c6980a75', '2025-12-17 13:57:33.132', '19:30', 2, NULL, 'Ana Invitado', 'invitado4@example.com', '+34 962683041', 'CANCELLED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-02 13:57:34.976', '2026-01-02 13:57:34.976', '390eb5e9-e5a8-4ed8-b4f9-935bbf6e8f0b');
INSERT INTO public."Booking" VALUES ('d46fe4b9-740c-4406-b96a-ab7891e00125', '2026-01-01 13:57:33.132', '17:00', 4, NULL, 'María Invitado', 'invitado5@example.com', '+34 1134640339', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-02 13:57:34.984', '2026-01-02 13:57:34.984', 'a9e5f96f-d6be-40cf-a58a-54d146704c58');
INSERT INTO public."Booking" VALUES ('f46f3287-2cd4-40e9-b2f8-3930709b9836', '2025-12-11 13:57:33.132', '21:00', 2, NULL, 'Miguel Invitado', 'invitado6@example.com', '+34 1091685017', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-02 13:57:35.007', '2026-01-02 13:57:35.007', '2d5ab711-3146-497e-b294-c3132c7f1868');
INSERT INTO public."Booking" VALUES ('d5b2c573-cba3-4566-96fd-d8f68046cacd', '2026-01-17 13:57:33.132', '15:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1012001128', 'CONFIRMED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.023', '2026-01-02 13:57:35.023', '053d0c87-f41f-4189-9c95-7767d63fcbae');
INSERT INTO public."Booking" VALUES ('b852356d-cf4e-4e30-8336-842460ca9b33', '2025-12-26 13:57:33.132', '19:30', 4, NULL, 'Miguel Invitado', 'invitado8@example.com', '+34 928420386', 'COMPLETED', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', NULL, '2026-01-02 13:57:35.03', '2026-01-02 13:57:35.03', 'a9e5f96f-d6be-40cf-a58a-54d146704c58');
INSERT INTO public."Booking" VALUES ('36dedfeb-734f-4510-8254-946df392aa09', '2026-01-12 13:57:33.132', '21:00', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1110402390', 'PENDING', '0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.04', '2026-01-02 13:57:35.04', '053d0c87-f41f-4189-9c95-7767d63fcbae');
INSERT INTO public."Booking" VALUES ('5cab8444-1ce6-4202-8e17-836c21a6b743', '2025-12-07 13:57:33.132', '15:00', 2, 'Preferimos zona tranquila', 'Laura Invitado', 'invitado0@example.com', '+34 701510016', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.05', '2026-01-02 13:57:35.05', 'f37edf7e-dfa9-434f-ae38-100489605fdd');
INSERT INTO public."Booking" VALUES ('9a3898d6-a10a-492f-9f30-fe0dd7e00a79', '2025-12-09 13:57:33.132', '17:00', 4, 'Silla de bebé necesaria', 'Carmen Invitado', 'invitado1@example.com', '+34 1285043308', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.056', '2026-01-02 13:57:35.056', '6a9c8396-2c93-4115-bf00-4a239fa0365d');
INSERT INTO public."Booking" VALUES ('2f6467fc-db16-4297-93a3-c8bf144e57c7', '2025-12-19 13:57:33.132', '21:30', 2, NULL, 'David Invitado', 'invitado2@example.com', '+34 1443147600', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.076', '2026-01-02 13:57:35.076', 'e2e24a91-9cf9-45a7-b7f5-8f3fd191926c');
INSERT INTO public."Booking" VALUES ('7b74704f-22ac-429e-85c7-840742c6eed4', '2025-12-25 13:57:33.132', '19:30', 6, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1409576196', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.083', '2026-01-02 13:57:35.083', 'd64c1659-1a4b-4592-ab78-4523655b6bc4');
INSERT INTO public."Booking" VALUES ('942e42cc-5840-47a7-bd1b-6792efb397e5', '2026-01-16 13:57:33.132', '16:30', 4, 'Preferimos zona tranquila', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1324229339', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.088', '2026-01-02 13:57:35.088', 'c443bd69-f472-4e17-877a-3b9efdfcde97');
INSERT INTO public."Booking" VALUES ('b5091a56-b77d-4125-b2e0-756aba0b4b16', '2026-01-26 13:57:33.132', '19:00', 4, NULL, 'Miguel Invitado', 'invitado5@example.com', '+34 806461131', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.101', '2026-01-02 13:57:35.101', 'd64c1659-1a4b-4592-ab78-4523655b6bc4');
INSERT INTO public."Booking" VALUES ('dc093d29-cb52-49b7-92fc-c1a6caeec62a', '2025-12-15 13:57:33.132', '18:00', 2, NULL, 'Javier Invitado', 'invitado6@example.com', '+34 1177958654', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.109', '2026-01-02 13:57:35.109', 'a0bca915-a8bd-4c1a-a77c-54495675e10f');
INSERT INTO public."Booking" VALUES ('483f5b81-84f4-48f3-b2ee-fde84489504a', '2026-01-17 13:57:33.132', '18:30', 2, NULL, 'María García', 'maria.garcia@example.com', '+34 1403531033', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.119', '2026-01-02 13:57:35.119', 'a0bca915-a8bd-4c1a-a77c-54495675e10f');
INSERT INTO public."Booking" VALUES ('e8ba349e-52e9-4d05-942b-227f9adaa661', '2025-12-08 13:57:33.132', '12:30', 4, NULL, 'Carmen Invitado', 'invitado8@example.com', '+34 1305286263', 'COMPLETED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', NULL, '2026-01-02 13:57:35.13', '2026-01-02 13:57:35.13', '833eb749-6342-43ec-b18d-8f1f0b5f736f');
INSERT INTO public."Booking" VALUES ('13c83473-7970-4d71-a9dd-7ad66292bf0b', '2026-01-03 13:57:33.132', '17:30', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 652792156', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.134', '2026-01-02 13:57:35.134', '72975457-eac3-4cff-af11-0c7400afe87a');
INSERT INTO public."Booking" VALUES ('b8203e97-dda7-4da6-aa4d-49fc5b21692f', '2026-01-26 13:57:33.132', '18:00', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 838927609', 'CONFIRMED', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.143', '2026-01-02 13:57:35.143', '833eb749-6342-43ec-b18d-8f1f0b5f736f');
INSERT INTO public."Booking" VALUES ('4ec2e33d-d524-4738-9b18-2f9555c333c7', '2026-01-31 13:57:33.132', '18:00', 2, NULL, 'Miguel Invitado', 'invitado0@example.com', '+34 1355857422', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.157', '2026-01-02 13:57:35.157', '9a32e157-b4b1-41ff-b735-0a446c993f96');
INSERT INTO public."Booking" VALUES ('ef2acf83-a6d8-4881-995d-487f8c421c63', '2026-01-18 13:57:33.132', '21:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1133774701', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.164', '2026-01-02 13:57:35.164', '17b49230-23f2-48f3-90be-d0507a75d4ac');
INSERT INTO public."Booking" VALUES ('afc84061-8611-4987-98fb-0697238641ee', '2025-12-07 13:57:33.132', '18:00', 2, NULL, 'Carlos Invitado', 'invitado2@example.com', '+34 1284693408', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.169', '2026-01-02 13:57:35.169', '093528d7-d290-45ef-82b4-daf5439b69c1');
INSERT INTO public."Booking" VALUES ('7e4a232f-b6c4-4660-81f7-35aa00697a12', '2025-12-09 13:57:33.132', '13:00', 4, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1134411194', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:35.185', '2026-01-02 13:57:35.185', '1e3e8593-7e6d-431d-9020-729ea5e7421b');
INSERT INTO public."Booking" VALUES ('25ee04b4-c679-4132-ba0a-a7380172037f', '2025-12-21 13:57:33.132', '12:30', 4, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 676818195', 'COMPLETED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.19', '2026-01-02 13:57:35.19', '17b49230-23f2-48f3-90be-d0507a75d4ac');
INSERT INTO public."Booking" VALUES ('5c2bd15b-9e85-4a21-b0bd-f1beaccc2a84', '2026-01-24 13:57:33.132', '13:30', 2, NULL, 'Laura Invitado', 'invitado5@example.com', '+34 1206400571', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.208', '2026-01-02 13:57:35.208', 'c5822f3a-aafe-4dfb-b014-1cea58f15420');
INSERT INTO public."Booking" VALUES ('2d7e7c27-0da7-4645-a0f0-43bffe2bc8f9', '2026-01-25 13:57:33.132', '12:00', 2, 'Silla de bebé necesaria', 'Ana Martínez', 'ana.martinez@example.com', '+34 886543194', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.214', '2026-01-02 13:57:35.214', '6fb3bc6a-41aa-4715-b687-6ac4f4601e40');
INSERT INTO public."Booking" VALUES ('f572604f-f2aa-40d1-ae2c-a75b90550fb9', '2026-01-08 13:57:33.132', '20:30', 2, 'Silla de bebé necesaria', 'Javier Invitado', 'invitado7@example.com', '+34 1036281603', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.222', '2026-01-02 13:57:35.222', '4eee1e3d-1ee3-470b-93c8-dc13e3e91074');
INSERT INTO public."Booking" VALUES ('257996b4-589d-485e-96ee-380f83b32241', '2026-01-29 13:57:33.132', '16:30', 4, NULL, 'Carmen Invitado', 'invitado8@example.com', '+34 961312611', 'PENDING', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.233', '2026-01-02 13:57:35.233', '4eee1e3d-1ee3-470b-93c8-dc13e3e91074');
INSERT INTO public."Booking" VALUES ('f46f57bd-5d14-4f93-8d09-e895aa1802b0', '2026-01-14 13:57:33.132', '14:00', 4, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 794074226', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.239', '2026-01-02 13:57:35.239', 'c7d82531-20be-4ad4-89f5-bff60ba8927f');
INSERT INTO public."Booking" VALUES ('173472c9-9bc4-4e8d-8fb7-8489af570672', '2026-01-07 13:57:33.132', '19:30', 4, 'Silla de bebé necesaria', 'María García', 'maria.garcia@example.com', '+34 1094189733', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.255', '2026-01-02 13:57:35.255', '4eee1e3d-1ee3-470b-93c8-dc13e3e91074');
INSERT INTO public."Booking" VALUES ('e52e4d4f-dc51-4c78-9ba6-d66d13783ea1', '2026-01-27 13:57:33.132', '15:00', 4, 'Alergia a los frutos secos', 'Ana Martínez', 'ana.martinez@example.com', '+34 1419606615', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.275', '2026-01-02 13:57:35.275', '2ff7ae34-993d-48fe-a9d2-f9ad1b1dbe94');
INSERT INTO public."Booking" VALUES ('0fe78a99-b821-4fcb-a90f-2380a045d41a', '2026-01-13 13:57:33.132', '13:30', 2, 'Preferimos zona tranquila', 'Carmen Invitado', 'invitado12@example.com', '+34 814856156', 'CONFIRMED', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', NULL, '2026-01-02 13:57:35.291', '2026-01-02 13:57:35.291', '7c866212-33c6-4106-bb43-0d6711a79f50');
INSERT INTO public."Booking" VALUES ('4d10973f-7755-4d1d-83ce-1b664c44429a', '2025-12-18 13:57:33.132', '12:30', 8, NULL, 'Javier Sánchez', 'javier.sanchez@example.com', '+34 1010735156', 'CANCELLED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj3p0005mizj19j864z4', '2026-01-02 13:57:35.324', '2026-01-02 13:57:35.324', '23674bbd-2633-4dcc-ade2-11bef18e0fa7');
INSERT INTO public."Booking" VALUES ('22682c49-5686-40ff-ba68-3d0423767457', '2025-12-05 13:57:33.132', '18:30', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 1351099577', 'CANCELLED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.343', '2026-01-02 13:57:35.343', '757f1f6d-3400-4eb4-84dd-adafa24075da');
INSERT INTO public."Booking" VALUES ('496ea871-0dd3-4766-aa5b-9382de4077f7', '2026-01-26 13:57:33.132', '15:30', 8, NULL, 'Laura Invitado', 'invitado2@example.com', '+34 700511702', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-02 13:57:35.356', '2026-01-02 13:57:35.356', '23674bbd-2633-4dcc-ade2-11bef18e0fa7');
INSERT INTO public."Booking" VALUES ('e49398cb-0a64-46a7-951c-3d0b852b12fe', '2025-12-18 13:57:33.132', '17:30', 2, NULL, 'Carmen Invitado', 'invitado3@example.com', '+34 956575799', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-02 13:57:35.36', '2026-01-02 13:57:35.36', 'cf70734a-32a0-4da0-90a0-e276155b98c4');
INSERT INTO public."Booking" VALUES ('46423a65-caad-402d-874c-563c9e82bfb3', '2026-01-01 13:57:33.132', '17:30', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1112741910', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:35.386', '2026-01-02 13:57:35.386', 'ac3fae8e-defd-4458-963f-5dd252a4d0ba');
INSERT INTO public."Booking" VALUES ('590ccff5-ca3a-4531-b8b2-e7712ebae978', '2025-12-03 13:57:33.132', '18:30', 8, 'Preferimos zona tranquila', 'David Invitado', 'invitado5@example.com', '+34 931741428', 'COMPLETED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-02 13:57:35.402', '2026-01-02 13:57:35.402', '23674bbd-2633-4dcc-ade2-11bef18e0fa7');
INSERT INTO public."Booking" VALUES ('44234856-5e35-4bfd-b8b9-f57bf043f1dc', '2026-01-13 13:57:33.132', '13:30', 2, 'Cumpleaños, ¿tienen tarta?', 'Miguel Invitado', 'invitado6@example.com', '+34 929853961', 'CONFIRMED', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-02 13:57:35.42', '2026-01-02 13:57:35.42', '83004c73-92ff-420c-9361-646d451034e6');
INSERT INTO public."Booking" VALUES ('2536451e-2b4a-4851-bab5-1773cc8dc676', '2026-01-16 13:57:33.132', '15:00', 4, NULL, 'Carmen Invitado', 'invitado7@example.com', '+34 882603846', 'PENDING', '64e51b94-36d3-41e8-b6c0-8894153febae', NULL, '2026-01-02 13:57:35.427', '2026-01-02 13:57:35.427', '2289e983-b4a8-4516-a620-a2ec517e3f6b');
INSERT INTO public."Booking" VALUES ('0dc66ab5-d8a8-4a88-bac1-2525fdcf199b', '2026-01-12 13:57:33.132', '14:00', 6, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1347135061', 'PENDING', '64e51b94-36d3-41e8-b6c0-8894153febae', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.438', '2026-01-02 13:57:35.438', '148359bc-6078-412a-abe3-c6c96d35d61d');
INSERT INTO public."Booking" VALUES ('c9c84259-4c05-4615-9fe6-30ef010adc3c', '2026-01-16 13:57:33.132', '20:30', 4, 'Preferimos zona tranquila', 'Carlos Invitado', 'invitado0@example.com', '+34 1206145985', 'CONFIRMED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-02 13:57:35.45', '2026-01-02 13:57:35.45', '4b5b414e-559d-4152-a181-47a23316a1ad');
INSERT INTO public."Booking" VALUES ('50df4cc0-8b05-4807-8353-f7182cc1b196', '2025-12-09 13:57:33.132', '20:30', 4, 'Preferimos zona tranquila', 'María Invitado', 'invitado1@example.com', '+34 1416177439', 'COMPLETED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-02 13:57:35.458', '2026-01-02 13:57:35.458', '101356e3-a909-4f22-ad84-5a49f79eff71');
INSERT INTO public."Booking" VALUES ('2fd186c7-1f68-4431-855d-ad985103ec37', '2026-01-07 13:57:33.132', '15:30', 4, NULL, 'David Invitado', 'invitado2@example.com', '+34 1117387739', 'CONFIRMED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-02 13:57:35.47', '2026-01-02 13:57:35.47', '731f679d-3191-42d2-abf8-dae8dbd74ef7');
INSERT INTO public."Booking" VALUES ('f4192d38-0970-43b8-99ce-a6930383764f', '2025-12-12 13:57:33.132', '12:00', 2, 'Preferimos zona tranquila', 'Carlos Invitado', 'invitado3@example.com', '+34 1428062629', 'CANCELLED', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-02 13:57:35.477', '2026-01-02 13:57:35.477', '22d2d96d-6c10-4443-a19b-06a08a5c80ef');
INSERT INTO public."Booking" VALUES ('b09c6d76-e7b7-4a25-8bf6-393c47f95afa', '2026-01-18 13:57:33.132', '18:00', 2, 'Alergia a los frutos secos', 'Laura Invitado', 'invitado4@example.com', '+34 1125694110', 'PENDING', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', NULL, '2026-01-02 13:57:35.484', '2026-01-02 13:57:35.484', '1af98fa9-7461-45fd-a65d-3428109f72d0');
INSERT INTO public."Booking" VALUES ('d37d4e3f-8806-4011-9943-b6f2967b0827', '2025-12-20 13:57:33.132', '21:00', 8, NULL, 'María García', 'maria.garcia@example.com', '+34 910032437', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.494', '2026-01-02 13:57:35.494', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('47a7e05a-e4c5-4af1-b53d-38803ef43b60', '2026-01-15 13:57:33.132', '16:00', 4, 'Preferimos zona tranquila', 'María García', 'maria.garcia@example.com', '+34 1208990378', 'PENDING', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.502', '2026-01-02 13:57:35.502', '18c37a76-2505-426d-9c55-3f7499643ecb');
INSERT INTO public."Booking" VALUES ('1027a10b-453a-42e5-96a6-f0ff6395a6fa', '2025-12-31 13:57:33.132', '12:30', 2, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1036645199', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:35.517', '2026-01-02 13:57:35.517', '5bca5e92-f2a1-4904-afec-deec2f36fe6f');
INSERT INTO public."Booking" VALUES ('607fc787-8318-4d45-bb56-ac6dc8316953', '2026-01-29 13:57:33.132', '18:30', 8, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 819072655', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.524', '2026-01-02 13:57:35.524', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('d49eddbe-dee8-4f44-8cd8-dd084fb7007f', '2026-01-23 13:57:33.132', '16:30', 8, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 1298613528', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.533', '2026-01-02 13:57:35.533', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('c1d44634-30f1-40a0-84c0-87bbf1305ad1', '2025-12-24 13:57:33.132', '14:30', 8, NULL, 'Javier Invitado', 'invitado6@example.com', '+34 1049505996', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-02 13:57:35.54', '2026-01-02 13:57:35.54', '3e364e43-930a-4bf0-a71e-f04eb2709851');
INSERT INTO public."Booking" VALUES ('0ed6b170-2394-498a-975b-0c218f715aba', '2026-01-05 13:57:33.132', '16:30', 2, 'Silla de bebé necesaria', 'Carlos Invitado', 'invitado7@example.com', '+34 1287327261', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-02 13:57:35.547', '2026-01-02 13:57:35.547', '97ba300f-01b3-42e4-84eb-87d92901d9e4');
INSERT INTO public."Booking" VALUES ('438cd927-cf27-46d3-b8e8-dbf4ccfff4c4', '2025-12-28 13:57:33.132', '13:30', 2, 'Silla de bebé necesaria', 'Ana Martínez', 'ana.martinez@example.com', '+34 1140879950', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.553', '2026-01-02 13:57:35.553', '71640588-e23f-410b-81dd-06bc2e1f8f5b');
INSERT INTO public."Booking" VALUES ('09b5dd6d-8aa3-4738-b2ef-f64a5ffd1f39', '2025-12-21 13:57:33.132', '18:00', 2, 'Preferimos zona tranquila', 'Laura Invitado', 'invitado9@example.com', '+34 653371927', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-02 13:57:35.567', '2026-01-02 13:57:35.567', '5bca5e92-f2a1-4904-afec-deec2f36fe6f');
INSERT INTO public."Booking" VALUES ('002e079f-6dab-43bc-a88d-4e7e7efa0757', '2025-12-14 13:57:33.132', '18:30', 2, 'Alergia a los frutos secos', 'Ana Invitado', 'invitado10@example.com', '+34 1054685322', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-02 13:57:35.574', '2026-01-02 13:57:35.574', '922b5aec-15d2-4b66-9ef8-27874f1ff6f3');
INSERT INTO public."Booking" VALUES ('fe532108-9c71-466d-b6ad-56569dc4249a', '2025-12-14 13:57:33.132', '17:30', 2, NULL, 'María Invitado', 'invitado11@example.com', '+34 687210702', 'COMPLETED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', NULL, '2026-01-02 13:57:35.581', '2026-01-02 13:57:35.581', '3e6b05ec-a377-4ce0-a1ed-9d3a440872fd');
INSERT INTO public."Booking" VALUES ('72811497-382d-4c11-a648-53b0fed91aca', '2026-01-28 13:57:33.132', '20:30', 2, NULL, 'Carmen Pérez', 'carmen.perez@example.com', '+34 1038209908', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:35.591', '2026-01-02 13:57:35.591', '3e6b05ec-a377-4ce0-a1ed-9d3a440872fd');
INSERT INTO public."Booking" VALUES ('8e2501d8-e655-4a11-8ffb-7a3be5425ff4', '2026-01-26 13:57:33.132', '12:30', 4, 'Cumpleaños, ¿tienen tarta?', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1407223714', 'PENDING', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.609', '2026-01-02 13:57:35.609', 'f2b7e6e9-2925-493d-bb8f-c25687ac3921');
INSERT INTO public."Booking" VALUES ('ea00cca9-36a3-4d28-8f22-21489f0f8c05', '2025-12-30 13:57:33.132', '16:00', 2, NULL, 'Carmen Invitado', 'invitado1@example.com', '+34 1439408474', 'COMPLETED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', NULL, '2026-01-02 13:57:35.618', '2026-01-02 13:57:35.618', '19531aa8-7f3c-4391-a88d-4158f5382914');
INSERT INTO public."Booking" VALUES ('a1816874-3087-4943-b609-4b2ccff6e419', '2026-01-05 13:57:33.132', '12:00', 2, NULL, 'David Rodríguez', 'david.rodriguez@example.com', '+34 916944982', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.622', '2026-01-02 13:57:35.622', '4acdcab3-6fdc-4ff6-ad6a-ec96d3236ed4');
INSERT INTO public."Booking" VALUES ('c628a657-642f-45bc-acdc-a2eedaf16735', '2025-12-22 13:57:33.132', '14:30', 2, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1294241495', 'COMPLETED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.63', '2026-01-02 13:57:35.63', '5f5902ca-c0f7-46d2-9b0b-1a87277b5cfe');
INSERT INTO public."Booking" VALUES ('8562b214-1ec7-4349-9813-d90bca771c12', '2026-01-24 13:57:33.132', '20:30', 6, NULL, 'María García', 'maria.garcia@example.com', '+34 1016359341', 'PENDING', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.643', '2026-01-02 13:57:35.643', '3f7a9251-2d3f-4ead-8650-0aea0e10cd37');
INSERT INTO public."Booking" VALUES ('5fb40e93-d1b6-4aa4-9df0-34085b90a944', '2026-01-13 13:57:33.132', '18:00', 2, NULL, 'Carmen Invitado', 'invitado5@example.com', '+34 1108540018', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', NULL, '2026-01-02 13:57:35.651', '2026-01-02 13:57:35.651', '4acdcab3-6fdc-4ff6-ad6a-ec96d3236ed4');
INSERT INTO public."Booking" VALUES ('04baaf1d-4938-4b5c-ae28-80cc45cc0fce', '2026-01-18 13:57:33.132', '19:30', 4, NULL, 'David Invitado', 'invitado6@example.com', '+34 871846989', 'CONFIRMED', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', NULL, '2026-01-02 13:57:35.656', '2026-01-02 13:57:35.656', '3f7a9251-2d3f-4ead-8650-0aea0e10cd37');
INSERT INTO public."Booking" VALUES ('ca852a12-b5d7-4975-a273-6dd9cc3e5fd0', '2025-12-20 13:57:33.132', '21:00', 4, NULL, 'María García', 'maria.garcia@example.com', '+34 1409822784', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.666', '2026-01-02 13:57:35.666', '9f9eb72b-9364-46b6-93f7-98a3f876f1d4');
INSERT INTO public."Booking" VALUES ('fe201a83-7c91-4e61-9732-fd6fa2b8576a', '2025-12-03 13:57:33.132', '18:00', 6, 'Preferimos zona tranquila', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1403831485', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.671', '2026-01-02 13:57:35.671', 'd6aa73fb-a68c-4fb5-8b85-677de136ad8a');
INSERT INTO public."Booking" VALUES ('3bf964b7-2a39-44e3-9cae-cda56c8e6a45', '2026-01-23 13:57:33.132', '17:00', 2, 'Silla de bebé necesaria', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1042080426', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.675', '2026-01-02 13:57:35.675', '8a7f9151-c51e-4536-b5e6-052b48c90b52');
INSERT INTO public."Booking" VALUES ('cb384a84-5aac-411e-a51b-bcf03f3018d8', '2026-01-23 13:57:33.132', '16:00', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 611343094', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.702', '2026-01-02 13:57:35.702', '6b04cbec-0bfe-458d-823b-8ae777f5ee95');
INSERT INTO public."Booking" VALUES ('578a95a8-ee85-4d1d-9bb5-302535bfefe0', '2026-01-04 13:57:33.132', '13:00', 4, NULL, 'Miguel Gómez', 'miguel.gomez@example.com', '+34 1289550780', 'PENDING', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj4g0007mizj541ffey5', '2026-01-02 13:57:35.718', '2026-01-02 13:57:35.718', '75433366-3484-4e51-b185-98283a5b2751');
INSERT INTO public."Booking" VALUES ('e7b25616-85da-4f09-b109-6d2dc7be38e5', '2025-12-03 13:57:33.132', '20:30', 4, NULL, 'Carmen Invitado', 'invitado5@example.com', '+34 673588715', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-02 13:57:35.723', '2026-01-02 13:57:35.723', 'ced498bf-08c8-415a-bda5-596740371b01');
INSERT INTO public."Booking" VALUES ('b7e63e6e-22a3-45e1-9152-9c09de1d7dea', '2026-01-24 13:57:33.132', '12:00', 6, 'Alergia a los frutos secos', 'María García', 'maria.garcia@example.com', '+34 1247578008', 'PENDING', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj0s0000mizjl9xsycl8', '2026-01-02 13:57:35.741', '2026-01-02 13:57:35.741', '62a03b58-1135-4b7d-ac0a-613456dcf215');
INSERT INTO public."Booking" VALUES ('f72dcb2c-cbd5-4566-a87a-a28fe72c14ba', '2026-01-01 13:57:33.132', '18:30', 6, 'Silla de bebé necesaria', 'David Rodríguez', 'david.rodriguez@example.com', '+34 1436020131', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj320003mizjo8ymq3lu', '2026-01-02 13:57:35.758', '2026-01-02 13:57:35.758', '96d351fd-2d36-4bf3-a7c5-962c786a654e');
INSERT INTO public."Booking" VALUES ('b4aea540-1b6e-4b29-a906-b6eab6c050a3', '2026-01-29 13:57:33.132', '19:00', 4, NULL, 'Laura Invitado', 'invitado8@example.com', '+34 1330834626', 'PENDING', 'de8b1efc-02b3-4184-a40e-9991956164ce', NULL, '2026-01-02 13:57:35.768', '2026-01-02 13:57:35.768', '75433366-3484-4e51-b185-98283a5b2751');
INSERT INTO public."Booking" VALUES ('e86c4d5f-a120-4b3d-8148-f2465a9b0246', '2025-12-13 13:57:33.132', '15:30', 4, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 798423786', 'COMPLETED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.78', '2026-01-02 13:57:35.78', '96d351fd-2d36-4bf3-a7c5-962c786a654e');
INSERT INTO public."Booking" VALUES ('0ed5e644-02de-448a-834b-65f7183bd5e3', '2026-01-05 13:57:33.132', '16:00', 4, NULL, 'Laura Fernández', 'laura.fernandez@example.com', '+34 1414181652', 'CONFIRMED', 'de8b1efc-02b3-4184-a40e-9991956164ce', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.786', '2026-01-02 13:57:35.786', '75433366-3484-4e51-b185-98283a5b2751');
INSERT INTO public."Booking" VALUES ('b046470e-b4c0-4f25-a388-8861a612562a', '2026-01-03 13:57:33.132', '18:30', 6, 'Cumpleaños, ¿tienen tarta?', 'Carmen Pérez', 'carmen.perez@example.com', '+34 846603838', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj420006mizjdyc8lpl3', '2026-01-02 13:57:35.799', '2026-01-02 13:57:35.799', '303f44c9-97c0-46bf-8717-1353899351d4');
INSERT INTO public."Booking" VALUES ('fdc8966d-9a1a-4f67-a22c-a213f2a040ff', '2026-01-22 13:57:33.132', '12:30', 2, NULL, 'Carlos Invitado', 'invitado1@example.com', '+34 1310492151', 'PENDING', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-02 13:57:35.88', '2026-01-02 13:57:35.88', '94294e16-0150-4f8f-95ca-41cc684eae23');
INSERT INTO public."Booking" VALUES ('dfe1e96c-7026-47fd-b9e6-5a82dcacc8a5', '2025-12-08 13:57:33.132', '15:00', 8, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 959133893', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.902', '2026-01-02 13:57:35.902', '3e67fb96-d55a-413c-9627-3792571ca82a');
INSERT INTO public."Booking" VALUES ('1af995ef-3c0a-40d3-ab12-c7ac2162d3fa', '2026-01-30 13:57:33.132', '18:00', 6, NULL, 'Ana Martínez', 'ana.martinez@example.com', '+34 1493212983', 'CONFIRMED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj2j0002mizjdn003odp', '2026-01-02 13:57:35.914', '2026-01-02 13:57:35.914', '00ce1475-afef-419f-ab64-3bf737817867');
INSERT INTO public."Booking" VALUES ('c069fc14-9e88-4bfa-99c1-964a93a09889', '2025-12-20 13:57:33.132', '14:00', 2, NULL, 'Carlos López', 'carlos.lopez@example.com', '+34 835852028', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'cmjw0jj270001mizjrndtq19q', '2026-01-02 13:57:35.921', '2026-01-02 13:57:35.921', '0206f936-c093-4bda-b4b9-a19ff562785d');
INSERT INTO public."Booking" VALUES ('f9a14bf7-1b31-4290-adf6-6a1914c64117', '2025-12-04 13:57:33.132', '12:30', 2, NULL, 'Javier Invitado', 'invitado5@example.com', '+34 794187172', 'COMPLETED', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', NULL, '2026-01-02 13:57:35.934', '2026-01-02 13:57:35.934', 'a68d7d8b-6c1b-49a3-8d8f-b6fa51ea5dcd');
INSERT INTO public."Booking" VALUES ('6aad3f91-a67c-4e20-9830-a05d3e2d2c28', '2026-01-31 13:57:33.132', '12:30', 2, NULL, 'Ana Invitado', 'invitado6@example.com', '+34 890646443', 'CONFIRMED', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7', NULL, '2026-01-02 13:57:33.624', '2026-01-02 14:01:30.801', '9f71791e-8e33-4097-abb2-0f6618a6d2c7');
INSERT INTO public."Booking" VALUES ('5b206134-378d-4533-bcd8-9590f333a3a9', '2026-01-31 13:57:33.132', '21:00', 2, 'Cumpleaños, ¿tienen tarta?', 'Laura Fernández', 'laura.fernandez@example.com', '+34 1097402151', 'CONFIRMED', '4691f3ea-941f-4a28-90a3-e5f02c42018c', 'cmjw0jj3d0004mizjlgsb5s7q', '2026-01-02 13:57:35.51', '2026-01-02 14:02:02.87', '71640588-e23f-410b-81dd-06bc2e1f8f5b');
INSERT INTO public."Booking" VALUES ('2362d835-e1a2-40df-be31-77b5d1378b59', '2026-01-03 00:00:00', '21:30', 2, '', 'jose mas', 'josemas68@gmail.com', '685951848', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-02 18:21:37.262', '2026-01-02 18:21:37.262', NULL);
INSERT INTO public."Booking" VALUES ('c919d62b-98e4-475f-8741-5588aff998a5', '2026-01-03 00:00:00', '21:30', 2, '', 'jose mas', 'josemas68@gmail.com', '685951884', 'CONFIRMED', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-02 18:30:05.754', '2026-01-02 18:36:18.718', '0cd0212e-d4f1-4283-bf27-f4427dde3151');
INSERT INTO public."Booking" VALUES ('e2d7a735-c25b-4b92-968c-9ffe07620004', '2026-01-03 00:00:00', '21:30', 7, '', 'jose mas', 'josemas68@gmail.com', '+34685951848', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-02 21:02:03.426', '2026-01-02 21:02:03.426', NULL);
INSERT INTO public."Booking" VALUES ('6bdc30ab-791f-41ee-a6f8-f3a92976672d', '2026-01-03 00:00:00', '14:30', 6, '', 'jose mas', 'josemas68@gmail.com', '+34685951848', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-02 22:01:08.404', '2026-01-02 22:01:08.404', NULL);
INSERT INTO public."Booking" VALUES ('265923ea-422b-4b1d-9891-930d8673e8c5', '2026-01-06 00:00:00', '07:00', 5, '', 'jose mas', 'josemas68@gmail.com', '+34685951848', 'PENDING', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2026-01-05 07:18:41.74', '2026-01-05 07:20:04.408', '152d7ab8-d71f-4543-b3ee-a7a987f51798');


--
-- Data for Name: BookingReminder; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."BookingReminder" VALUES ('d862e637-59d2-4fb9-8c3a-9ba1af29ae99', '10:00', false, 'DAILY', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-02 18:59:36.559', '2026-01-02 18:59:36.559');


--
-- Data for Name: BookingService; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."BookingService" VALUES ('bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', 'Cena', '', '{1,2,3,4,5,6,0}', true, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-02 18:19:18.333', '2026-01-02 18:19:18.333');
INSERT INTO public."BookingService" VALUES ('0d16523d-8932-4e51-b98c-4405601b6c65', 'Comida', '', '{1,2,3,4,5,6,0}', true, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-02 18:20:08.955', '2026-01-02 18:20:08.955');
INSERT INTO public."BookingService" VALUES ('7c3943ee-cb35-4e14-833e-0db843e2a5d1', 'Desayuno', 'DEayuna de forma especial', '{1,2,3,5,6,0}', true, '6d0d7ede-0858-4f7f-a898-1789f7b42df7', '2026-01-05 07:08:01.404', '2026-01-05 07:08:01.404');


--
-- Data for Name: BookingSlot; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."BookingSlot" VALUES ('7da6732e-0c39-402b-b6d3-bf383b1dabff', '20:00', '21:30', 90, NULL, 'bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', '2026-01-02 18:19:18.333', '2026-01-02 18:19:18.333');
INSERT INTO public."BookingSlot" VALUES ('7950c8f6-ec50-4719-a42c-583c6c8910cd', '21:30', '23:00', 90, NULL, 'bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', '2026-01-02 18:19:18.333', '2026-01-02 18:19:18.333');
INSERT INTO public."BookingSlot" VALUES ('781e98dd-c0e7-410a-a177-d0ecb7a8006f', '13:00', '14:30', 90, NULL, '0d16523d-8932-4e51-b98c-4405601b6c65', '2026-01-02 18:20:08.955', '2026-01-02 18:20:08.955');
INSERT INTO public."BookingSlot" VALUES ('4e25f037-f92e-4c9d-9623-d533e6bbf39e', '14:30', '16:00', 90, NULL, '0d16523d-8932-4e51-b98c-4405601b6c65', '2026-01-02 18:20:08.955', '2026-01-02 18:20:08.955');
INSERT INTO public."BookingSlot" VALUES ('4ef51c89-42eb-4ca0-a8cb-040477ecd427', '07:00', '08:30', 90, NULL, '7c3943ee-cb35-4e14-833e-0db843e2a5d1', '2026-01-05 07:08:01.404', '2026-01-05 07:08:01.404');
INSERT INTO public."BookingSlot" VALUES ('655a1089-5692-4792-a583-047895acf23a', '08:30', '10:00', 90, NULL, '7c3943ee-cb35-4e14-833e-0db843e2a5d1', '2026-01-05 07:08:01.404', '2026-01-05 07:08:01.404');


--
-- Data for Name: Menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Menu" VALUES ('dc7360bc-a1a2-4156-8317-9d8bf0b22fdd', 'Menú del dia', 'Elige 6 primeros y 6 segundos cafe y postre incluido', 25.00, true, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 14:25:58.5', '2025-12-31 14:49:40.979');
INSERT INTO public."Menu" VALUES ('1b02818b-8eb2-43be-aebf-b5e17ac6c28e', 'Menú del Día', 'Menú completo de mediodía con entrante, principal y postre', 12.50, true, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 15:10:10.467', '2025-12-31 15:10:10.467');
INSERT INTO public."Menu" VALUES ('4b90cea1-ac4c-4576-af67-48bf8695aa27', 'Menú del Día', 'Primer plato, segundo plato, postre y bebida', 15.90, true, 'owner_001', '2025-12-31 04:09:03.727', '2025-12-31 04:09:03.727');
INSERT INTO public."Menu" VALUES ('c2299bed-b888-4ac2-8a7e-12da66bb83de', 'Carta de Sushi', 'Selección premium de sushi y sashimi', NULL, true, 'owner_001', '2025-12-31 04:09:03.737', '2025-12-31 04:09:03.737');
INSERT INTO public."Menu" VALUES ('d152aad6-1a4f-4f26-8a1c-cc3cec5b7da9', 'Menú Mexicano', 'Tacos, quesadillas y más', NULL, true, 'owner_002', '2025-12-31 04:09:03.745', '2025-12-31 04:09:03.745');
INSERT INTO public."Menu" VALUES ('f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', 'Menú Degustación', 'Experiencia gastronómica completa con 7 platos', 45.00, true, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 15:10:10.555', '2025-12-31 15:10:10.555');
INSERT INTO public."Menu" VALUES ('fd804972-d77d-4fb2-88fb-8e0df5b0f71a', 'Carta Principal', 'Platos a la carta disponibles todo el día', NULL, true, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Menu" VALUES ('49ece132-c697-4386-aaaa-532b5cf7d26c', 'Menú Vegetariano', 'Opciones 100% vegetales y saludables', 18.00, true, 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 15:10:10.59', '2025-12-31 15:10:10.59');


--
-- Data for Name: Dish; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Dish" VALUES ('4fa2befc-4d0c-4ff0-818b-163c776fff3c', 'Ensalada Mixta', 'Lechuga, tomate, cebolla y aceitunas', 0.00, NULL, '{gluten}', 1, '1b02818b-8eb2-43be-aebf-b5e17ac6c28e', '2025-12-31 15:10:10.467', '2025-12-31 15:10:10.467');
INSERT INTO public."Dish" VALUES ('84faab31-124e-426f-b52d-a1cfaaa6c8c1', 'Paella Valenciana', 'Arroz con pollo, conejo y verduras', 0.00, NULL, '{}', 2, '1b02818b-8eb2-43be-aebf-b5e17ac6c28e', '2025-12-31 15:10:10.467', '2025-12-31 15:10:10.467');
INSERT INTO public."Dish" VALUES ('b3a29e22-be53-4d01-be6d-645be90cbfca', 'Flan Casero', 'Postre tradicional', 0.00, NULL, '{lácteos,huevo}', 3, '1b02818b-8eb2-43be-aebf-b5e17ac6c28e', '2025-12-31 15:10:10.467', '2025-12-31 15:10:10.467');
INSERT INTO public."Dish" VALUES ('670a67a5-d3b2-4ef8-8e96-454158e8d2c9', 'Tartar de Atún', 'Atún rojo con aguacate y sésamo', 0.00, NULL, '{pescado,sésamo}', 1, 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2025-12-31 15:10:10.555', '2025-12-31 15:10:10.555');
INSERT INTO public."Dish" VALUES ('6e40f1af-b011-413b-9d72-095b9f55c867', 'Risotto de Trufa', 'Arroz cremoso con trufa negra', 0.00, NULL, '{lácteos}', 2, 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2025-12-31 15:10:10.555', '2025-12-31 15:10:10.555');
INSERT INTO public."Dish" VALUES ('e01092f6-8b14-48e0-a9fa-0e1e3016db4d', 'Solomillo de Ternera', 'Con reducción de vino tinto', 0.00, NULL, '{sulfitos}', 3, 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2025-12-31 15:10:10.555', '2025-12-31 15:10:10.555');
INSERT INTO public."Dish" VALUES ('77899388-9d2f-43b1-b9e6-2159af0471fd', 'Torrija con Helado', 'Torrija caramelizada con helado de vainilla', 0.00, NULL, '{gluten,lácteos,huevo}', 4, 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2025-12-31 15:10:10.555', '2025-12-31 15:10:10.555');
INSERT INTO public."Dish" VALUES ('6bd9ff8f-5561-4efd-8939-edb77262eb59', 'Jamón Ibérico de Bellota', '100g de jamón ibérico premium', 18.50, NULL, '{}', 1, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('d022c760-bcdf-42e0-8006-cd7b9c6e951d', 'Croquetas de la Abuela', 'Croquetas caseras de jamón (8 unidades)', 9.50, NULL, '{gluten,lácteos,huevo}', 2, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('39929a35-7c6b-43d3-ac5b-720290f0c228', 'Spaghetti Carbonara', 'Pasta fresca con huevo, queso pecorino y guanciale', 12.50, 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400', '{huevo,gluten,lácteos}', 1, '4b90cea1-ac4c-4576-af67-48bf8695aa27', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('aca44d01-49db-4b02-8765-a3c23e20e430', 'Pizza Margherita', 'Tomate, mozzarella, albahaca fresca', 10.00, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400', '{gluten,lácteos}', 2, '4b90cea1-ac4c-4576-af67-48bf8695aa27', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('14bbe4d1-4d19-4ec7-bfc6-cb658bfb701e', 'Tiramisú', 'Postre tradicional italiano con café y mascarpone', 6.50, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400', '{huevo,lácteos,gluten}', 3, '4b90cea1-ac4c-4576-af67-48bf8695aa27', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('a3ebdf1e-3a0d-4323-9b63-a9a16b0cb6db', 'Nigiri de Salmón', '2 piezas de salmón fresco sobre arroz', 8.00, 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400', '{pescado}', 1, 'c2299bed-b888-4ac2-8a7e-12da66bb83de', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('bc6aee83-7d80-4c83-a6d0-2c0e5a28c385', 'California Roll', 'Rollo de cangrejo, aguacate y pepino', 12.00, 'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?w=400', '{pescado,mariscos}', 2, 'c2299bed-b888-4ac2-8a7e-12da66bb83de', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('d795c6a9-cf45-43f9-a192-2cc50302a5df', 'Sashimi Variado', 'Selección de 12 piezas de pescado fresco', 22.00, NULL, '{pescado}', 3, 'c2299bed-b888-4ac2-8a7e-12da66bb83de', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('4083e5a0-338c-4087-9e4d-2fe941f48f2a', 'Tacos al Pastor', '3 tacos de cerdo marinado con piña', 9.50, 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400', '{}', 1, 'd152aad6-1a4f-4f26-8a1c-cc3cec5b7da9', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('7f02ad18-060c-484b-b8f7-14ec68464308', 'Quesadillas de Pollo', 'Tortilla rellena de pollo y queso', 8.00, 'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=400', '{lácteos}', 2, 'd152aad6-1a4f-4f26-8a1c-cc3cec5b7da9', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('99c5936a-2df8-48f5-b015-20502593f53c', 'Guacamole con Nachos', 'Guacamole fresco con chips de maíz', 6.50, 'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=400', '{}', 3, 'd152aad6-1a4f-4f26-8a1c-cc3cec5b7da9', '2025-12-31 04:09:03.764', '2025-12-31 04:09:03.764');
INSERT INTO public."Dish" VALUES ('9744b15c-3320-4783-b940-af4741866321', 'Pulpo a la Gallega', 'Pulpo cocido con pimentón y aceite de oliva', 22.00, NULL, '{moluscos}', 3, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('94bd8a70-da94-4b46-b64e-c7f564af158a', 'Lubina a la Sal', 'Lubina entera al horno (para 2 personas)', 38.00, NULL, '{pescado}', 4, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('fa8f192a-6eb0-4741-9639-e2195c18797b', 'Entrecot de Buey', '300g de entrecot con guarnición', 28.50, NULL, '{}', 5, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('7c108508-dc6c-491a-9fec-cb8d63d83073', 'Tarta de Queso', 'Cheesecake cremosa estilo Nueva York', 6.50, NULL, '{gluten,lácteos,huevo}', 6, 'fd804972-d77d-4fb2-88fb-8e0df5b0f71a', '2025-12-31 15:10:10.572', '2025-12-31 15:10:10.572');
INSERT INTO public."Dish" VALUES ('5c23c87f-528c-4dd2-bb9f-c3d86a516dbe', 'Bowl Quinoa y Aguacate', 'Quinoa, aguacate, tomate cherry y edamame', 0.00, NULL, '{soja}', 2, '49ece132-c697-4386-aaaa-532b5cf7d26c', '2025-12-31 15:10:10.59', '2025-12-31 15:10:10.59');
INSERT INTO public."Dish" VALUES ('467ab079-5f2b-43a9-ad42-2a8740d116a1', 'Brownie Vegano', 'Brownie de chocolate sin ingredientes animales', 0.00, NULL, '{gluten,"frutos secos"}', 3, '49ece132-c697-4386-aaaa-532b5cf7d26c', '2025-12-31 15:10:10.59', '2025-12-31 15:10:10.59');
INSERT INTO public."Dish" VALUES ('ef5ad3e2-356a-45a8-b087-d8e9ff8c1bf8', 'Hummus con Crudités', 'Hummus casero con verduras frescas', 0.00, NULL, '{sésamo}', 1, '49ece132-c697-4386-aaaa-532b5cf7d26c', '2025-12-31 15:10:10.59', '2026-01-02 21:09:00.804');


--
-- Data for Name: EmailTemplate; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."EmailTemplate" VALUES ('de02d854-eca7-4531-b01a-a55c15e3d9d5', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:13:12.062', '2026-01-02 19:13:12.062', NULL);
INSERT INTO public."EmailTemplate" VALUES ('cf9f55cd-bb74-4c61-8ea9-7cabe1f942f6', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:13:12.027', '2026-01-02 19:33:33.652', NULL);
INSERT INTO public."EmailTemplate" VALUES ('d478b2f7-8bf1-4850-a042-42c22f392254', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.868', '2026-01-02 19:43:56.868', '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."EmailTemplate" VALUES ('d2f312ad-6d9a-4be1-bdc8-2c87099ebb6e', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:56.895', '2026-01-02 19:43:56.895', '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."EmailTemplate" VALUES ('689b3793-608e-4994-b10f-be24111a9ae5', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.904', '2026-01-02 19:43:56.904', 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."EmailTemplate" VALUES ('41bcdf04-5700-4bae-8a60-ead7e9e65096', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.94', '2026-01-02 19:43:56.94', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."EmailTemplate" VALUES ('c81aea4a-ff47-413e-88cd-fcedaef087be', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:56.946', '2026-01-02 19:43:56.946', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."EmailTemplate" VALUES ('ca2f8737-43a3-42a9-a991-18875ec596ac', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.955', '2026-01-02 19:43:56.955', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."EmailTemplate" VALUES ('6e719a34-fe74-4afc-a5fb-52d882ac9b8f', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:56.965', '2026-01-02 19:43:56.965', '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."EmailTemplate" VALUES ('ddd24085-e3e0-4c73-bf76-86be9328df83', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.977', '2026-01-02 19:43:56.977', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."EmailTemplate" VALUES ('bde20193-de8e-4a45-8af5-d74024a2bf93', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:56.985', '2026-01-02 19:43:56.985', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."EmailTemplate" VALUES ('cc8974d9-8a3c-4d1c-836f-198306e5c1fa', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:56.993', '2026-01-02 19:43:56.993', '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."EmailTemplate" VALUES ('bd632bf5-8bf7-43e4-92ca-79ebe4508971', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.003', '2026-01-02 19:43:57.003', '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."EmailTemplate" VALUES ('52abc620-5db4-48ee-a179-2ac3f5bf7077', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.01', '2026-01-02 19:43:57.01', 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."EmailTemplate" VALUES ('76e10c63-fd84-44a1-8158-84f9f92967ff', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.018', '2026-01-02 19:43:57.018', 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."EmailTemplate" VALUES ('ece73c7f-9a95-4288-8e8a-5ab6053645e9', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.025', '2026-01-02 19:43:57.025', '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."EmailTemplate" VALUES ('fbb89503-1e4f-44c8-ac85-280c97691836', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.035', '2026-01-02 19:43:57.035', '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."EmailTemplate" VALUES ('a4803060-66f3-4f6a-bd29-97df69df4cbe', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.044', '2026-01-02 19:43:57.044', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."EmailTemplate" VALUES ('56c194ed-3010-4a76-a339-3735e0e48dae', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.056', '2026-01-02 19:43:57.056', 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."EmailTemplate" VALUES ('c841a3d8-e626-42d2-af85-7769d00b1cea', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.063', '2026-01-02 19:43:57.063', '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."EmailTemplate" VALUES ('da7a5483-ab15-46e4-afba-c4611c3f47ae', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.072', '2026-01-02 19:43:57.072', '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."EmailTemplate" VALUES ('1f142e53-df98-4876-9818-4cbfcfb0820f', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.079', '2026-01-02 19:43:57.079', '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."EmailTemplate" VALUES ('f783d43c-5033-4841-a9db-f1d87870bb7d', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.087', '2026-01-02 19:43:57.087', '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."EmailTemplate" VALUES ('b859e2d0-b073-4ff4-9f0a-ae484a24f233', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.096', '2026-01-02 19:43:57.096', '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."EmailTemplate" VALUES ('86bd8472-ecc6-418e-8c60-b2fca3f3077e', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.104', '2026-01-02 19:43:57.104', '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."EmailTemplate" VALUES ('81a4f00e-759f-435f-93e3-74826bd5d20c', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.111', '2026-01-02 19:43:57.111', 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."EmailTemplate" VALUES ('0be33992-8921-469e-91b4-15aace21cc6d', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.121', '2026-01-02 19:43:57.121', 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."EmailTemplate" VALUES ('3f3e457e-d9a4-4510-a5fc-8701c3f8c49a', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.136', '2026-01-02 19:43:57.136', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."EmailTemplate" VALUES ('58711ca7-5bab-4ae7-8019-994decac9347', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.149', '2026-01-02 19:43:57.149', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."EmailTemplate" VALUES ('9d092a2d-f369-4d39-afcd-01b503dc9f29', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.157', '2026-01-02 19:43:57.157', '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."EmailTemplate" VALUES ('101ffa0e-dd22-4d7f-a682-0fb15338384f', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.164', '2026-01-02 19:43:57.164', '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."EmailTemplate" VALUES ('e156ce39-65dc-4270-9126-a70ccbd52c01', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.172', '2026-01-02 19:43:57.172', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."EmailTemplate" VALUES ('7d4c5c3a-09a1-4ff1-bc7d-116c9ea1d6c2', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.178', '2026-01-02 19:43:57.178', 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."EmailTemplate" VALUES ('c85ee15d-14a1-43bd-8408-bd7632f1c8e6', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.188', '2026-01-02 19:43:57.188', 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."EmailTemplate" VALUES ('45e0383d-1c20-4f29-bc3b-a1ecc2f3f526', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.206', '2026-01-02 19:43:57.206', 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."EmailTemplate" VALUES ('2c51cb7f-977f-42b2-a0ee-472fefb6179f', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.213', '2026-01-02 19:43:57.213', '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."EmailTemplate" VALUES ('0e84018d-dd95-4ee7-bd94-846df76e5bea', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.223', '2026-01-02 19:43:57.223', '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."EmailTemplate" VALUES ('abee6074-32b6-4cde-b030-20626db73f94', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.234', '2026-01-02 19:43:57.234', '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."EmailTemplate" VALUES ('9147736f-627c-487a-adde-bd77e9ecccd7', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.241', '2026-01-02 19:43:57.241', '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."EmailTemplate" VALUES ('4cbc760d-8e08-4e08-a6aa-bc288eaf1f86', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.249', '2026-01-02 19:43:57.249', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."EmailTemplate" VALUES ('5b60c4e5-acbb-4542-af47-b3f1e1b07f87', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.256', '2026-01-02 19:43:57.256', 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."EmailTemplate" VALUES ('684bd02c-7ba5-47da-9a71-8983d9e5c1ae', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.272', '2026-01-02 19:43:57.272', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."EmailTemplate" VALUES ('1ac40070-1556-43e0-a7c7-c22e0db633a2', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.279', '2026-01-02 19:43:57.279', '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."EmailTemplate" VALUES ('51ff1c11-8037-4e88-b163-db8ac0bf3f56', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.289', '2026-01-02 19:43:57.289', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."EmailTemplate" VALUES ('d3a961a9-86af-4173-9bc4-701f56a606fb', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.296', '2026-01-02 19:43:57.296', 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."EmailTemplate" VALUES ('5ea609e0-82d4-42eb-9686-e9c68409d29d', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.303', '2026-01-02 19:43:57.303', 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."EmailTemplate" VALUES ('af360a1e-244a-436d-bea3-b47afd4ceb04', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.318', '2026-01-02 19:43:57.318', 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."EmailTemplate" VALUES ('80bd2b20-073c-4521-8431-6975526f57b4', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.327', '2026-01-02 19:43:57.327', 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."EmailTemplate" VALUES ('07f9cea1-03ba-4514-8ffb-7049e5d35af1', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.344', '2026-01-02 19:43:57.344', 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."EmailTemplate" VALUES ('a9a7da0a-62ba-4fdb-82f5-757aa276280e', 'BOOKING_CANCELLED', 'Cancelación de Reserva', 'Email enviado al cliente cuando se cancela una reserva', 'Reserva cancelada en {{restaurantName}}', '<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>', '{"fields": ["customerName", "restaurantName", "date", "time", "partySize", "reason"]}', true, '2026-01-02 19:43:57.351', '2026-01-02 19:43:57.351', '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."EmailTemplate" VALUES ('fd48b9d1-46cc-4af4-be00-5de4d8fc4358', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767382391608-ChatGPT%20Image%2030%20dic%202025_%2014_44_32.png?w=240px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 120px;" width="120"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">Hola {{customerName}} tu reserva se ha recibido correctamente</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:57.361', '2026-01-02 19:43:57.361', '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."EmailTemplate" VALUES ('31640b90-40e0-4622-85ea-ffc749a692b0', 'BOOKING_CONFIRMATION', 'Confirmación de Reserva', 'Email enviado al cliente cuando se crea o confirma una reserva', 'Reserva confirmada en {{restaurantName}}', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
  <title></title>
  
    <style type="text/css">
      
      @media only screen and (min-width: 520px) {
        .u-row {
          width: 500px !important;
        }

        .u-row .u-col {
          vertical-align: top;
        }

        
            .u-row .u-col-50 {
              width: 250px !important;
            }
          

            .u-row .u-col-100 {
              width: 500px !important;
            }
          
      }

      @media only screen and (max-width: 520px) {
        .u-row-container {
          max-width: 100% !important;
          padding-left: 0px !important;
          padding-right: 0px !important;
        }

        .u-row {
          width: 100% !important;
        }

        .u-row .u-col {
          display: block !important;
          width: 100% !important;
          min-width: 320px !important;
          max-width: 100% !important;
        }

        .u-row .u-col > div {
          margin: 0 auto;
        }


        .u-row .u-col img {
          max-width: 100% !important;
        }

}
    
body{margin:0;padding:0}table,td,tr{border-collapse:collapse;vertical-align:top}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors=true]{color:inherit!important;text-decoration:none!important}


table, td { color: #000000; } </style>
  
  

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #F7F8F9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table role="presentation" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #F7F8F9;width:100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top">
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
    <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #F7F8F9;"><![endif]-->
    
  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="500" style="width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-100" style="max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://assets.unlayer.com/projects/0/1767596985470-ChatGPT%20Image%2030%20dic%202025_%2014_44_51.png?w=326.4px" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 34%;max-width: 163.2px;" width="163.2"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">This is a new Text block. Change the text.{{customerName}}</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


  
  
<div class="u-row-container" style="padding: 0px;background-color: transparent">
  <div class="u-row" style="margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
    <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
      <!--[if (mso)|(IE)]><table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:500px;"><tr style="background-color: transparent;"><![endif]-->
      
<!--[if (mso)|(IE)]><td align="center" width="250" style="width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-50" style="max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
  <div style="font-size: 14px; line-height: 140%; text-align: left; word-wrap: break-word;">
    <p style="line-height: 140%;">This is a new Text block. Change the text.</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
<!--[if (mso)|(IE)]><td align="center" width="250" style="width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;" valign="top"><![endif]-->
<div class="u-col u-col-50" style="max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;">
  <div style="height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;">
  <!--[if (!mso)&(!IE)]><!--><div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;"><!--<![endif]-->
  
<table style="font-family:arial,helvetica,sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
  <tbody>
    <tr>
      <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;" align="left">
        
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td style="padding-right: 0px;padding-left: 0px;" align="center">
      
      <img align="center" border="0" src="https://cdn.tools.unlayer.com/image/placeholder.png" alt="" title="" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 230px;" width="230"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
  </div>
  


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
', '{"fields": ["customerName", "restaurantName", "restaurantAddress", "date", "time", "partySize", "specialNotes", "tableNumber", "tableArea"]}', true, '2026-01-02 19:43:56.919', '2026-01-05 07:10:45.411', 'fcb7520f-ffde-4fc6-b870-5293b3813814');


--
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Favorite" VALUES ('c755182e-b8ae-4c2d-a224-c105861402dc', 'cmju3r7x40001jynhiqbwsno4', '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2025-12-31 16:05:15.635');
INSERT INTO public."Favorite" VALUES ('c8930ad2-733b-49ae-8734-41c35d86ef3e', 'cmju3r7x40001jynhiqbwsno4', '561c4d10-d81e-42e4-87f0-958a2f854fa1', '2026-01-01 22:09:02.708');


--
-- Data for Name: Subscription; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Invoice; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: OpeningHour; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."OpeningHour" VALUES ('d616fe4e-dfa4-4593-b375-3bb1dea1dbfc', 0, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('3ebeaeed-4568-4809-ae6a-249622d6f6ca', 1, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('a435c762-7efc-4ce1-9031-b4df9cbd1a57', 2, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('fcd05949-0507-4dab-aba5-ff5bb1b65d4e', 3, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('52b77800-dfca-4b0d-9442-be111f523dc4', 4, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('7696916f-217e-4d30-a39a-3cf2aaf3c35c', 5, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('f4b499ef-256c-4bf3-b545-6ba11ec38989', 6, '09:00', '22:00', false, '6d0d7ede-0858-4f7f-a898-1789f7b42df7');
INSERT INTO public."OpeningHour" VALUES ('6eafa6e8-dc41-4273-af90-24401a4e9403', 0, '12:00', '23:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('d01e064f-29e7-4d76-8a2e-ed27fb24afe5', 1, NULL, NULL, true, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('d12d479e-118d-4883-a286-4adad61f009a', 2, '12:00', '23:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('22c462a8-02fc-4d08-8a4c-6e3386c2f96f', 3, '12:00', '23:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('be54a791-c0d5-4163-93a2-fe7d98c589d9', 4, '12:00', '23:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('36d9a73e-0b7f-4fae-92cd-6a08b9a035d2', 5, '12:00', '00:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('6c346fcc-57b1-4a2c-8f8f-64415e4cb453', 6, '12:00', '00:00', false, 'de8b1efc-02b3-4184-a40e-9991956164ce');
INSERT INTO public."OpeningHour" VALUES ('4ad1c869-ea1f-4f1e-9954-6bc39ea08729', 0, NULL, NULL, true, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('4d9ad591-00db-4ab8-bf90-e7271fdfe183', 1, NULL, NULL, true, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('1683b99e-08a4-486b-8f21-7315f6bf3f1e', 2, '13:00', '23:00', false, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('53c834ce-b833-499c-adb9-5de07ebd91e1', 3, '13:00', '23:00', false, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('6dd51c02-34d1-4edb-9c0b-63cdb37e2b2a', 4, '13:00', '23:00', false, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('e1ba4c63-c1a9-470b-8b0d-95d0045e13fb', 5, '13:00', '00:00', false, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('e4ce7243-0082-441f-9819-ffba317b0ffc', 6, '13:00', '00:00', false, 'a839c8d2-2a02-40e2-920b-c43c9cda0394');
INSERT INTO public."OpeningHour" VALUES ('c1f0f42f-2ca3-4388-b738-265b4e35ad8e', 0, NULL, NULL, true, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('0de60919-4014-473d-8080-32dfe4620220', 1, NULL, NULL, true, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('91289898-7bc8-40cf-bfa2-4c988a22b468', 2, '13:00', '23:00', false, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('16e4691c-91a9-452d-ac78-c9379b3f3d49', 3, '13:00', '23:00', false, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('1714eafe-1ed5-4638-a4dd-5450a96afd20', 4, '13:00', '23:00', false, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('826c9bb2-eb10-4456-925f-317057241528', 5, '13:00', '00:00', false, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('fc4d392f-b898-4038-bd9c-4bcd9372b662', 6, '13:00', '00:00', false, '4691f3ea-941f-4a28-90a3-e5f02c42018c');
INSERT INTO public."OpeningHour" VALUES ('72d0f872-a6ba-4c8a-9964-26b66d1a2e5e', 0, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('9ad691a5-7819-4cc5-bdce-dde0be5493c2', 1, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('61b083cc-eb36-4904-a226-d96d5cf7c943', 2, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('d8a73a0f-689b-4a64-a908-d483d94135e6', 3, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('3afba4cb-16d3-40b5-8b2d-104b1e6f909b', 4, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('174f5c08-4ab9-452d-9ac5-029cad9ede26', 5, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('dd24605c-50e7-4cd9-8bc9-5caf115c315f', 6, '11:00', '23:30', false, '64e51b94-36d3-41e8-b6c0-8894153febae');
INSERT INTO public."OpeningHour" VALUES ('445cba46-a325-4e29-a7a0-be5f26ba1b1d', 0, NULL, NULL, true, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('1a911427-4118-45f8-b9f4-416b2d83eb65', 1, NULL, NULL, true, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('f41cd9d1-ed9d-4bb4-a542-9c6c4219b58a', 2, '13:00', '23:00', false, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('86dd3547-24c8-43e3-abed-9f85b756a433', 3, '13:00', '23:00', false, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('e4b18f36-8f9f-4b0e-a276-f9796992e1af', 4, '13:00', '23:00', false, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('196ddf2e-08b0-4586-aa93-54835c817d68', 5, '13:00', '00:00', false, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('f8270a92-5f6a-4e3e-b38f-c81cf1a7e94f', 6, '13:00', '00:00', false, 'fcb7520f-ffde-4fc6-b870-5293b3813814');
INSERT INTO public."OpeningHour" VALUES ('c7850d93-fb46-4f3f-bba1-e41df2861fd5', 0, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('b09ab0a1-d2a5-4c2e-a8f0-4c053f45546a', 1, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('bd8c438f-a043-4d22-b2fd-ed2f8842ba96', 2, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('de648641-27ef-4ae4-a4b9-775aa91c2ea1', 3, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('e8c26352-306f-4aa3-8a1e-cd3241cc5d4f', 4, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('21cdc5e7-af30-4cc2-8b2c-5825b387cc98', 5, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('5766bf58-c78e-4072-ba83-35ec1af49ae3', 6, '11:00', '23:30', false, 'b74c8030-7571-417a-9b97-e82b80b500a6');
INSERT INTO public."OpeningHour" VALUES ('6bd8eb6a-6c48-4b36-b912-126fde83e44a', 0, '12:00', '23:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('83940856-94a0-4e2d-b5c6-792a6fca1e1d', 1, NULL, NULL, true, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('a2dfabee-35be-4be3-9cd8-f0a5f253093d', 2, '12:00', '23:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('4f4b8df9-6da2-4190-a68a-0ca8b7085350', 3, '12:00', '23:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('a81a5a96-0f97-4240-99e1-b6419f0e3d01', 4, '12:00', '23:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('8e2ea2b7-cfb0-4352-9732-35671a154c2c', 5, '12:00', '00:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('d68eb871-9003-4236-88d3-707d60017e8d', 6, '12:00', '00:00', false, '561c4d10-d81e-42e4-87f0-958a2f854fa1');
INSERT INTO public."OpeningHour" VALUES ('5c7aec8f-8956-4f3e-a688-a69043edf01c', 0, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('12490554-7648-452f-aa03-62f50033e7b8', 1, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('4555959a-70d8-4e40-830b-a7d942533c0d', 2, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('caf07326-ff6d-45b0-a44c-c05d57ed9753', 3, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('f9c4e2ad-5e68-4b8c-9210-7b05568ded61', 4, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('6e08d53f-ed97-4036-a48a-c6bca1578703', 5, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('fa021577-85c9-4310-bced-769f30be5be5', 6, '11:00', '23:30', false, '551b0921-a0e1-479f-94b6-949f91ec7fcf');
INSERT INTO public."OpeningHour" VALUES ('2f9e14ef-1fcf-4368-ab25-024c6058ab83', 0, NULL, NULL, true, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('fcef7120-cd07-4beb-b0f3-479088ffc414', 1, NULL, NULL, true, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('3c90e061-e18f-49fd-af22-6fd3e3a9bca2', 2, '13:00', '23:00', false, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('6686dae9-bb91-4e9e-bf25-bf1c348514e2', 3, '13:00', '23:00', false, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('330d6f12-208c-4ec0-bf14-06bbbb32c8b3', 4, '13:00', '23:00', false, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('19173f25-9743-4a4e-95c9-58be5c9ba958', 5, '13:00', '00:00', false, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('b7d5a13a-679b-4a92-b65a-1cc743f9e3de', 6, '13:00', '00:00', false, 'beb2ee2e-5fa1-48e3-a370-e101c197f5c5');
INSERT INTO public."OpeningHour" VALUES ('576dab9d-08e6-4cdb-897b-c1d6b8e6b0c7', 0, '12:00', '23:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('7fa12a94-1575-4d16-8dc2-1a1345a689dd', 1, NULL, NULL, true, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('530c3b7f-5d92-453c-b0e2-101745a053b0', 2, '12:00', '23:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('eef5b150-90a9-4e7e-a824-7e435190b23b', 3, '12:00', '23:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('a9fe5ba9-dea0-4787-bc80-d9f6e99203ca', 4, '12:00', '23:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('7704f443-3101-4459-99cd-ca4d25726697', 5, '12:00', '00:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('132713db-c191-4544-97c8-8a137265b949', 6, '12:00', '00:00', false, '777d3d7b-eeef-4855-82ff-34ed99b572e5');
INSERT INTO public."OpeningHour" VALUES ('b2d58b81-6e25-4128-8ab6-3106bf9ec6ce', 0, '12:00', '23:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('d6d2e936-c3fa-44d2-be1d-f56bbee573b8', 1, NULL, NULL, true, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('9c812cd0-b6e4-4510-9a2c-b90cad125551', 2, '12:00', '23:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('69fad4c3-a9d7-46f5-9bb4-730bb5a26ccd', 3, '12:00', '23:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('fd4a5c15-18f3-4698-966a-bfb7c3d6fa45', 4, '12:00', '23:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('83e44e4c-5d76-4ea9-924f-5aaa918a185b', 5, '12:00', '00:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('0c3c4757-4e9a-4f1a-9549-1d81c15c0cd2', 6, '12:00', '00:00', false, '9e6719c7-6d33-4c4b-84eb-83dc3d968d18');
INSERT INTO public."OpeningHour" VALUES ('9f4a31ca-c082-4f81-9168-cc56dbe1c6b5', 0, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('7d10f4cc-5505-4124-a830-af9894781e5e', 1, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('b9a02fe8-70b8-4339-aea9-c131338ee139', 2, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('459f9575-0ca8-4399-ad9c-38e15e4e03ce', 3, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('ea0092ff-0ac7-46b1-8a2c-056b03659c62', 4, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('e1588c23-d89c-4320-bd79-2bfea2381ba5', 5, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('9fc61167-d050-4e54-8214-2bae6af7659e', 6, '11:00', '23:30', false, 'fbf6b622-57cc-43cf-811b-d9d341a0a2d1');
INSERT INTO public."OpeningHour" VALUES ('1eba1e74-928e-48ef-9f77-61362a0ef769', 0, '12:00', '23:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('df7a9930-0d64-479b-892a-77d1f6451daf', 1, NULL, NULL, true, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('6556781c-d123-442a-8e19-999a930785e0', 2, '12:00', '23:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('ea406297-340e-49b7-a0e9-ec4771f60252', 3, '12:00', '23:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('d551a79a-b662-401f-b77e-bd851a7d01c4', 4, '12:00', '23:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('c4a68475-5364-45b0-90d7-85fcb27af35b', 5, '12:00', '00:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('70e536d9-903e-4752-8900-3c3ceda65521', 6, '12:00', '00:00', false, '3442a830-784d-4344-a5ec-96653a1b7212');
INSERT INTO public."OpeningHour" VALUES ('04a1902e-f04c-4638-aa05-0c47b5666351', 0, '12:00', '23:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('70183151-eb05-4b54-8f8e-384ca3c63676', 1, NULL, NULL, true, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('f6df3246-d736-439f-9086-2789364f249c', 2, '12:00', '23:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('2cc1b4b3-bc7f-4fbc-a080-1a8193ff62f1', 3, '12:00', '23:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('9010d842-f8d9-492c-8c67-483f42eeb129', 4, '12:00', '23:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('5d88ef6a-e049-4941-ba70-6cf98abfbfbc', 5, '12:00', '00:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('0e2a0f8d-39be-4fb3-81da-2dbb17fa67ec', 6, '12:00', '00:00', false, 'eb4160e1-2708-466d-bd46-9b33fcaefd80');
INSERT INTO public."OpeningHour" VALUES ('96be5477-b40a-4886-aed0-88b6af5a37da', 0, '12:00', '23:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('353cd80b-005a-444a-8786-a7fda46ebaa3', 1, NULL, NULL, true, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('a71c3775-e004-4c21-86d2-f9a3e46b7f34', 2, '12:00', '23:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('c5018be4-d378-4d83-92d1-b93c55ee715d', 3, '12:00', '23:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('004240f6-9706-4fc1-9b90-49743fd28caf', 4, '12:00', '23:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('90ae9250-9081-45b1-92c4-f1c4fdd9d5fa', 5, '12:00', '00:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('292638be-1bb2-4b3f-98b9-195a083b37e2', 6, '12:00', '00:00', false, 'f15d5a96-4fbc-4501-8c23-4e4e43a7742e');
INSERT INTO public."OpeningHour" VALUES ('bf0b0476-3f12-45dc-b929-dde4a64ab696', 0, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('cdf78a95-0ff2-402a-93bf-74bd84a4dece', 1, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('bd23d224-66d9-48c6-9662-275df16d5289', 2, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('3a5bb510-c05b-4375-a14d-455fc9ebc11a', 3, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('b260e86e-5d16-418a-ba1a-9d643e58bdbe', 4, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('31fcc522-bd54-4659-af0a-431a2a29c261', 5, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('8c0a1db4-eb54-4273-81b1-c80da583cb2c', 6, '11:00', '23:30', false, '12e5bce4-f71b-4bab-ab29-c35142ef1f3d');
INSERT INTO public."OpeningHour" VALUES ('fc64b29d-7ab4-47c3-92e3-b41af85ce273', 0, NULL, NULL, true, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('6418cc38-f20e-484a-876a-519ad2d34c1b', 1, NULL, NULL, true, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('071d0245-a336-4aa6-859e-9e5adbb90802', 2, '13:00', '23:00', false, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('ccdaaf5a-6ca1-41de-8eeb-a9e87541dd2a', 3, '13:00', '23:00', false, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('bce6753a-9cca-416a-aeaa-83de224edf19', 4, '13:00', '23:00', false, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('a179bfe4-cbb5-4a9f-9e77-16595fc7816c', 5, '13:00', '00:00', false, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('2ff5dc2e-a3fb-4db3-89c8-d3ac252c5f97', 6, '13:00', '00:00', false, '145073c9-c134-4ae0-b4e3-3fd81adfb2c9');
INSERT INTO public."OpeningHour" VALUES ('18064500-f4c1-4ae7-aa0f-2696d06ea136', 0, NULL, NULL, true, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('aa202cd0-ef1e-423a-bcfc-f63463ebd533', 1, NULL, NULL, true, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('9b4e3b82-9938-4efa-a940-3a8a0a6d7420', 2, '13:00', '23:00', false, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('7ae5a8b9-8c9b-4303-b6d2-ccb13e9567e6', 3, '13:00', '23:00', false, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('b5789db1-9f60-4497-8a0a-74d8db313910', 4, '13:00', '23:00', false, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('4d6e2ece-2215-4b19-bc09-f9296ab7efef', 5, '13:00', '00:00', false, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('b542ca0c-eef7-4d8b-8536-f05ea2a2832e', 6, '13:00', '00:00', false, 'ccb963c9-0da1-4961-8e96-98a60d9c5747');
INSERT INTO public."OpeningHour" VALUES ('f0d8a1c2-78e3-4734-ae14-0851b0e3f21f', 0, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('dbd7cd71-522e-4b19-a1e7-cc1c93a05eab', 1, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('6b0feb75-2553-4e8e-89ff-a623de736c53', 2, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('19e96a1d-8897-44b7-a823-be435cab36d4', 3, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('cdfe923e-ab3a-444f-aa1a-11eb6cf2b5ef', 4, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('6d17aa0a-f16e-4375-9f9a-58a55108a1b2', 5, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('87932635-89d8-4d59-aed3-300e35859273', 6, '11:00', '23:30', false, 'b44fd162-5a54-4487-8bf3-d3a37be88ec7');
INSERT INTO public."OpeningHour" VALUES ('ed4242e8-6e5d-4b26-8fc0-607f7d4736e5', 0, NULL, NULL, true, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('cab9cfc3-ee01-4224-860b-55d82a18887f', 1, NULL, NULL, true, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('459767fa-5d73-4176-90e4-1d1344a88d1d', 2, '13:00', '23:00', false, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('a701efa6-3e15-4a05-8746-76c7988c5ecf', 3, '13:00', '23:00', false, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('043f5cbe-4825-4bd5-a570-8f5f2114deb6', 4, '13:00', '23:00', false, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('d6770557-9752-43e3-a518-dcee0413bac2', 5, '13:00', '00:00', false, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('5c955a32-16d8-47f8-895d-d375d64256ad', 6, '13:00', '00:00', false, '3da8e4f3-21c8-48e5-9af8-50a930803e78');
INSERT INTO public."OpeningHour" VALUES ('8842f7df-4f73-47a1-85b4-0eec1eb0c70b', 0, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('9019b133-cf47-4d7e-beab-dc42cea12b81', 1, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('32dfe85a-7aef-45ce-8174-a259da3d5e9d', 2, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('ecd22bf2-43e9-49ea-bf1c-402305b15b06', 3, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('dd18aabf-8e97-494a-9aa5-fc26450233a0', 4, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('6da478a9-43a8-46ef-af75-49c9964e75cb', 5, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('0c194265-639d-4c65-8c3c-9f20ae9fd48c', 6, '11:00', '23:30', false, '0871b5a0-9cc8-46ba-8aff-41e294c4f613');
INSERT INTO public."OpeningHour" VALUES ('a4c42d19-2bbe-4a4b-bd0c-571aadd549e4', 0, NULL, NULL, true, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('79f488d2-659d-452b-9cb1-ed2fd1438044', 1, NULL, NULL, true, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('df686c93-4818-4164-87ed-b3a5bd5167b4', 2, '13:00', '23:00', false, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('4b167935-f654-46d8-8877-a5ec5c59f7d6', 3, '13:00', '23:00', false, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('36dc358c-6754-471c-bc50-8ca0c80a3205', 4, '13:00', '23:00', false, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('83ddc939-246a-4c5d-8477-8269e873c9a3', 5, '13:00', '00:00', false, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('c1b86fa8-d5e4-4d8c-b7e1-9e75089071cb', 6, '13:00', '00:00', false, '3b42d521-409f-4d8e-a1ee-a0a9e6b9096e');
INSERT INTO public."OpeningHour" VALUES ('7fdb525b-7572-40c4-95b1-67eb60da3bc1', 0, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('0fa87990-3bef-4407-8855-3c2dc193a124', 1, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('54b9c99a-725d-4025-9103-83990009ea8d', 2, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('1363fa01-790b-49ce-8ff9-422205eac750', 3, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('25ad42d1-69be-4290-b419-fecc028193d8', 4, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('0865bc96-9741-4fa1-bc5c-7b4bce78e149', 5, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('32edd85a-feb8-4c1c-96a1-0dcc84c61e2a', 6, '11:00', '23:30', false, '853c16e3-6906-4985-afad-211880a60917');
INSERT INTO public."OpeningHour" VALUES ('cf2ffc07-86a3-4342-b858-6dec1da47b80', 0, NULL, NULL, true, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('c3c1e7f4-85a4-42f5-adc6-98343e58e16f', 1, NULL, NULL, true, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('6dec6c1a-091e-4ec3-a701-b06aa8afe2b7', 2, '13:00', '23:00', false, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('40e4de3b-b3e8-4987-b0af-337d5bd99181', 3, '13:00', '23:00', false, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('e4d0cea4-e64c-423f-b6d1-e419d1c288cb', 4, '13:00', '23:00', false, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('99306cfd-6ff2-456b-8e16-1723838f3acd', 5, '13:00', '00:00', false, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');
INSERT INTO public."OpeningHour" VALUES ('dad45e41-27b6-449b-8fff-851811288fd1', 6, '13:00', '00:00', false, 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee');


--
-- Data for Name: PageSection; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."PageSection" VALUES ('5eccd1dc-b4dd-48e9-bf16-af990feb2955', 'CAROUSEL', 'Música en directo', NULL, 3, true, '{"limit": 12, "filter": "live-music"}', '2026-01-01 01:09:38.532', '2026-01-05 07:24:21.19');
INSERT INTO public."PageSection" VALUES ('f82d94cf-9374-4314-b35d-696fd7d2848e', 'CAROUSEL', 'Los mas exclusivos', 'Selección de los restaurantes más selectos', 1, true, '{"limit": 12, "filter": "popular"}', '2026-01-01 01:03:02.157', '2026-01-05 07:24:21.188');
INSERT INTO public."PageSection" VALUES ('f6bd354d-5f90-4a00-a694-a46ad1ece4ad', 'CAROUSEL', 'Destacados de Madrid', 'Espectacular', 5, true, '{"limit": 12, "filter": "madrid"}', '2026-01-02 21:53:42.751', '2026-01-05 07:24:21.199');
INSERT INTO public."PageSection" VALUES ('02ba5f62-279e-464c-9ee0-6431a4e36afa', 'CAROUSEL', 'Al aire libre', NULL, 4, true, '{"limit": 16, "filter": "terrace"}', '2026-01-01 01:11:26.786', '2026-01-05 07:24:21.194');
INSERT INTO public."PageSection" VALUES ('104bf6ad-15ce-4988-8c74-95921f725a2a', 'CAROUSEL', 'Los mejor valorados', 'Los favoritos de nuestros usuarios', 0, true, '{"limit": 12, "filter": "rating"}', '2026-01-01 00:07:45.88', '2026-01-05 07:24:21.211');
INSERT INTO public."PageSection" VALUES ('0a0695e1-2b97-49d6-ab88-f0f8feba2e81', 'HERO', 'Comprame a mi que molo mas', 'Es la ostai esto', 6, true, '{"imageUrl": "https://res.cloudinary.com/dtrrkfgy2/image/upload/v1767597179/foodzinder/jsrbiofxgyblefimr7ex.jpg", "buttonSize": "lg", "buttonText": "conocenos", "buttonAction": "/about", "contentPosition": "center"}', '2026-01-05 07:13:06.691', '2026-01-05 07:24:21.426');
INSERT INTO public."PageSection" VALUES ('8558719a-0e81-4f0a-8ddc-49021dcfb2b2', 'CAROUSEL', 'Para ir en familia', 'Los mejores restaurantes para disfrutar con tu familia', 2, true, '{"limit": 12, "filter": "rating"}', '2026-01-05 07:24:09.343', '2026-01-05 07:25:11.851');


--
-- Data for Name: RestaurantMenu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."RestaurantMenu" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'dc7360bc-a1a2-4156-8317-9d8bf0b22fdd', '2025-12-31 15:12:04.533');
INSERT INTO public."RestaurantMenu" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', '1b02818b-8eb2-43be-aebf-b5e17ac6c28e', '2025-12-31 15:12:04.546');
INSERT INTO public."RestaurantMenu" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2025-12-31 15:12:04.551');
INSERT INTO public."RestaurantMenu" VALUES ('9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '4b90cea1-ac4c-4576-af67-48bf8695aa27', '2025-12-31 04:09:03.751');
INSERT INTO public."RestaurantMenu" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'c2299bed-b888-4ac2-8a7e-12da66bb83de', '2025-12-31 04:09:03.751');
INSERT INTO public."RestaurantMenu" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', 'd152aad6-1a4f-4f26-8a1c-cc3cec5b7da9', '2025-12-31 04:09:03.751');
INSERT INTO public."RestaurantMenu" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', '49ece132-c697-4386-aaaa-532b5cf7d26c', '2025-12-31 15:19:29.407');
INSERT INTO public."RestaurantMenu" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', 'f2782a5f-0bd0-4db9-87ce-e150ee5cb3c0', '2026-01-02 13:59:43.51');
INSERT INTO public."RestaurantMenu" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', '49ece132-c697-4386-aaaa-532b5cf7d26c', '2026-01-05 07:21:21.262');


--
-- Data for Name: Taxonomy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Taxonomy" VALUES ('cccaefeb-eb23-45d2-beba-79d1370768fb', 'CUISINE_TYPE', 'Española', 'espanola', '2025-12-31 04:09:03.519');
INSERT INTO public."Taxonomy" VALUES ('1d6330a7-f7df-4d34-af51-ea9417c38122', 'CUISINE_TYPE', 'Italiana', 'italiana', '2025-12-31 04:09:03.519');
INSERT INTO public."Taxonomy" VALUES ('e631e936-1b8a-43bb-a9a1-63b7cdfe43b1', 'CUISINE_TYPE', 'Japonesa', 'japonesa', '2025-12-31 04:09:03.519');
INSERT INTO public."Taxonomy" VALUES ('8298de3a-d84c-4fc8-8751-6afb1f007a56', 'CUISINE_TYPE', 'China', 'china', '2025-12-31 04:09:03.523');
INSERT INTO public."Taxonomy" VALUES ('4c32f6ef-7c05-456e-b724-6f166c059a87', 'CUISINE_TYPE', 'Mexicana', 'mexicana', '2025-12-31 04:09:03.519');
INSERT INTO public."Taxonomy" VALUES ('f79991e2-f7be-4fb3-99bb-727a816c8885', 'CUISINE_TYPE', 'Francesa', 'francesa', '2026-01-01 01:21:39.13');
INSERT INTO public."Taxonomy" VALUES ('ff2db2e9-dea3-4756-a1da-8ed98594e269', 'CUISINE_TYPE', 'India', 'india', '2026-01-01 01:21:39.144');
INSERT INTO public."Taxonomy" VALUES ('14f3a707-f32e-41a1-ac23-84350cc4f079', 'CUISINE_TYPE', 'Tailandesa', 'tailandesa', '2026-01-01 01:21:39.15');
INSERT INTO public."Taxonomy" VALUES ('68b1db8f-6377-4afd-97bc-48e0e99e10db', 'CUISINE_TYPE', 'Americana', 'americana', '2025-12-31 04:09:03.52');
INSERT INTO public."Taxonomy" VALUES ('8cbfee50-b16d-4913-a0fc-66af82d2ece6', 'CUISINE_TYPE', 'Argentina', 'argentina', '2026-01-01 01:21:39.161');
INSERT INTO public."Taxonomy" VALUES ('050574f4-97ed-4b8e-a5d0-36b3b0016bb1', 'CUISINE_TYPE', 'Peruana', 'peruana', '2026-01-01 01:21:39.165');
INSERT INTO public."Taxonomy" VALUES ('61a191bb-b65a-4e0f-a134-cdb474e737de', 'CUISINE_TYPE', 'Mediterránea', 'mediterranea', '2026-01-01 01:21:39.17');
INSERT INTO public."Taxonomy" VALUES ('4f0c153a-f3af-4db0-b37b-66c77303fe1e', 'CUISINE_TYPE', 'Fusión', 'fusion', '2026-01-01 01:21:39.175');
INSERT INTO public."Taxonomy" VALUES ('76472cb6-3253-4980-b13d-3506f2a18ee1', 'CUISINE_TYPE', 'Sushi', 'sushi', '2026-01-01 01:21:39.181');
INSERT INTO public."Taxonomy" VALUES ('fae4f4de-498e-4760-a84b-4f76a916abfd', 'CUISINE_TYPE', 'BBQ/Parrilla', 'bbq-parrilla', '2026-01-01 01:21:39.186');
INSERT INTO public."Taxonomy" VALUES ('2cbb1d92-74bb-4e2b-a479-19234ed62143', 'CUISINE_TYPE', 'Mariscos', 'mariscos', '2026-01-01 01:21:39.192');
INSERT INTO public."Taxonomy" VALUES ('abd5e2db-28bb-4576-bd49-2c50d7d1cb21', 'CUISINE_TYPE', 'Tapas', 'tapas', '2026-01-01 01:21:39.198');
INSERT INTO public."Taxonomy" VALUES ('a158097f-02b1-4322-9e75-7922702bf4de', 'CUISINE_TYPE', 'Hamburguesas', 'hamburguesas', '2026-01-01 01:21:39.204');
INSERT INTO public."Taxonomy" VALUES ('ddf50c72-d1a2-472c-abb9-c2ecc8fe06a1', 'CUISINE_TYPE', 'Pizza', 'pizza', '2026-01-01 01:21:39.21');
INSERT INTO public."Taxonomy" VALUES ('910e9334-82e6-43ae-ae5e-f260ceb4d5be', 'CUISINE_TYPE', 'Vegana', 'vegana', '2026-01-01 01:21:39.214');
INSERT INTO public."Taxonomy" VALUES ('15d8192b-606a-44dc-9453-6d8491c01f30', 'RESTAURANT_FEATURE', 'Terraza', 'terraza', '2025-12-31 04:09:03.642');
INSERT INTO public."Taxonomy" VALUES ('acbad7ee-5427-4995-88b4-d4b8b4873461', 'RESTAURANT_FEATURE', 'Jardín', 'jardin', '2026-01-01 01:21:39.224');
INSERT INTO public."Taxonomy" VALUES ('04a8779f-a4a4-4113-a26c-e1f3f231d627', 'RESTAURANT_FEATURE', 'Espacio exterior', 'outdoor', '2026-01-01 01:21:39.228');
INSERT INTO public."Taxonomy" VALUES ('c1869a67-4d2b-4adc-901d-123fcd0ad972', 'RESTAURANT_FEATURE', 'Parking', 'parking', '2025-12-31 04:09:03.642');
INSERT INTO public."Taxonomy" VALUES ('7157b5d0-570b-4e9d-b1f2-c1d7c73e7a01', 'RESTAURANT_FEATURE', 'WiFi gratis', 'wifi-gratis', '2025-12-31 04:09:03.642');
INSERT INTO public."Taxonomy" VALUES ('1d2d22b8-bc26-4b0b-9eb5-886eba350f11', 'RESTAURANT_FEATURE', 'Accesible', 'accesible', '2026-01-01 01:21:39.242');
INSERT INTO public."Taxonomy" VALUES ('c01c5d13-755b-414a-aca8-51e8f942e48c', 'RESTAURANT_FEATURE', 'Acepta mascotas', 'pet-friendly', '2025-12-31 04:09:03.642');
INSERT INTO public."Taxonomy" VALUES ('8355ec8f-1021-4d75-96d3-0eb320686c9b', 'RESTAURANT_FEATURE', 'Aire acondicionado', 'aire-acondicionado', '2026-01-01 01:21:39.251');
INSERT INTO public."Taxonomy" VALUES ('40f1ac90-4604-4d98-9f59-f9a3d032201e', 'RESTAURANT_FEATURE', 'Música en vivo', 'musica-vivo', '2026-01-01 01:21:39.255');
INSERT INTO public."Taxonomy" VALUES ('0f22b130-a1f9-404a-8d71-8bd6d1097608', 'RESTAURANT_FEATURE', 'Eventos privados', 'eventos', '2026-01-01 01:21:39.26');
INSERT INTO public."Taxonomy" VALUES ('5cdd3625-b84b-409d-82c8-5191c709892a', 'RESTAURANT_FEATURE', 'Servicio a domicilio', 'delivery', '2026-01-01 01:21:39.264');
INSERT INTO public."Taxonomy" VALUES ('e8143c94-9cf3-4510-8dd8-5d9bc6634bd0', 'RESTAURANT_FEATURE', 'Para llevar', 'takeaway', '2026-01-01 01:21:39.268');
INSERT INTO public."Taxonomy" VALUES ('7bccfdf9-d375-4ec7-9328-49d648b27539', 'RESTAURANT_FEATURE', 'Bar', 'bar', '2026-01-01 01:21:39.273');
INSERT INTO public."Taxonomy" VALUES ('98bdd546-885c-4027-951d-eefa2c493d55', 'RESTAURANT_FEATURE', 'Bodega de vinos', 'bodega-vinos', '2026-01-01 01:21:39.277');
INSERT INTO public."Taxonomy" VALUES ('3f48d104-0b20-49cd-b651-6a9e6ae99a61', 'RESTAURANT_FEATURE', 'Vista panorámica', 'vista-panoramica', '2026-01-01 01:21:39.281');
INSERT INTO public."Taxonomy" VALUES ('7bf0ff9e-0e01-4757-9cb0-fc0dc47bb3eb', 'RESTAURANT_FEATURE', 'Chimenea', 'chimenea', '2026-01-01 01:21:39.285');
INSERT INTO public."Taxonomy" VALUES ('26b74a4b-a89d-4db1-a04f-5f91496bf018', 'RESTAURANT_FEATURE', 'Reserva online', 'reserva-online', '2026-01-01 01:21:39.291');
INSERT INTO public."Taxonomy" VALUES ('87b2bf62-bd5a-4edf-8c47-c9aab719470d', 'DIETARY', 'Vegetariano', 'vegetariano', '2025-12-31 04:09:03.648');
INSERT INTO public."Taxonomy" VALUES ('dd668a55-00a4-4e96-884f-7b62774e9e86', 'DIETARY', 'Vegano', 'vegano', '2025-12-31 04:09:03.648');
INSERT INTO public."Taxonomy" VALUES ('2b1f0430-764b-4bf0-b5ab-0f7b0e8657ca', 'DIETARY', 'Sin gluten', 'sin-gluten', '2025-12-31 04:09:03.648');
INSERT INTO public."Taxonomy" VALUES ('9bf56a30-1823-4143-9d84-d844db999a80', 'DIETARY', 'Sin lactosa', 'sin-lactosa', '2026-01-01 01:21:39.31');
INSERT INTO public."Taxonomy" VALUES ('2efc07b9-72dd-4e35-be02-fa8d29f528e0', 'DIETARY', 'Halal', 'halal', '2026-01-01 01:21:39.315');
INSERT INTO public."Taxonomy" VALUES ('48f38f6f-2d0c-4e2b-9c26-31693e5763c8', 'DIETARY', 'Kosher', 'kosher', '2026-01-01 01:21:39.32');
INSERT INTO public."Taxonomy" VALUES ('749464e4-530f-4cbc-89ef-7498a6625b98', 'DIETARY', 'Opciones saludables', 'saludable', '2026-01-01 01:21:39.325');
INSERT INTO public."Taxonomy" VALUES ('73be202f-80e0-4b38-862d-6768da684be6', 'DIETARY', 'Orgánico', 'organico', '2026-01-01 01:21:39.331');
INSERT INTO public."Taxonomy" VALUES ('547e85f8-8f68-46f5-8dac-43b98979ccfb', 'AMBIANCE', 'Romántico', 'romantico', '2026-01-01 01:21:39.335');
INSERT INTO public."Taxonomy" VALUES ('3e21f309-f331-4d43-a58d-ad22fa7ec9ca', 'AMBIANCE', 'Familiar', 'familiar', '2026-01-01 01:21:39.341');
INSERT INTO public."Taxonomy" VALUES ('ae28a514-16ca-4c1c-9d05-1e862d240abf', 'AMBIANCE', 'Casual', 'casual', '2026-01-01 01:21:39.345');
INSERT INTO public."Taxonomy" VALUES ('3d668620-d47a-47ad-870d-36699faf4a66', 'AMBIANCE', 'Elegante', 'elegante', '2026-01-01 01:21:39.35');
INSERT INTO public."Taxonomy" VALUES ('cc5df94d-748d-46ab-832b-36eafd927aa0', 'AMBIANCE', 'Moderno', 'moderno', '2026-01-01 01:21:39.354');
INSERT INTO public."Taxonomy" VALUES ('e036a9ad-1b97-41d0-b942-d46720df3c79', 'AMBIANCE', 'Rústico', 'rustico', '2026-01-01 01:21:39.359');
INSERT INTO public."Taxonomy" VALUES ('62913b4f-eb8d-4d0c-8c86-bb65cb49767c', 'AMBIANCE', 'Acogedor', 'acogedor', '2026-01-01 01:21:39.364');
INSERT INTO public."Taxonomy" VALUES ('b18a5b50-cc73-4c8d-8cf7-d29db0c4fef0', 'AMBIANCE', 'Tranquilo', 'tranquilo', '2026-01-01 01:21:39.368');
INSERT INTO public."Taxonomy" VALUES ('05418836-6a29-487d-86fd-6d23ca97316d', 'AMBIANCE', 'Animado', 'animado', '2026-01-01 01:21:39.372');
INSERT INTO public."Taxonomy" VALUES ('237bbad5-6b12-4506-9af5-3f8ac404f2ad', 'AMBIANCE', 'De lujo', 'lujo', '2026-01-01 01:21:39.377');
INSERT INTO public."Taxonomy" VALUES ('6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0', 'AMBIANCE', 'Tradicional', 'tradicional', '2026-01-01 01:21:39.381');
INSERT INTO public."Taxonomy" VALUES ('f3dc575d-ae95-4c6a-94c1-ee271b7995ff', 'AMBIANCE', 'Bohemio', 'bohemio', '2026-01-01 01:21:39.385');
INSERT INTO public."Taxonomy" VALUES ('da6214ee-fbbf-46c0-a746-8d175ed9be0d', 'AMBIANCE', 'Industrial', 'industrial', '2026-01-01 01:21:39.39');


--
-- Data for Name: RestaurantTaxonomy; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."RestaurantTaxonomy" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'e631e936-1b8a-43bb-a9a1-63b7cdfe43b1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'c01c5d13-755b-414a-aca8-51e8f942e48c');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '76472cb6-3253-4980-b13d-3506f2a18ee1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', 'c1869a67-4d2b-4adc-901d-123fcd0ad972');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', '87b2bf62-bd5a-4edf-8c47-c9aab719470d');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cc5df94d-748d-46ab-832b-36eafd927aa0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('eb4160e1-2708-466d-bd46-9b33fcaefd80', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', '68b1db8f-6377-4afd-97bc-48e0e99e10db');
INSERT INTO public."RestaurantTaxonomy" VALUES ('9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '15d8192b-606a-44dc-9453-6d8491c01f30');
INSERT INTO public."RestaurantTaxonomy" VALUES ('9e6719c7-6d33-4c4b-84eb-83dc3d968d18', '7157b5d0-570b-4e9d-b1f2-c1d7c73e7a01');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3442a830-784d-4344-a5ec-96653a1b7212', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('64e51b94-36d3-41e8-b6c0-8894153febae', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', '15d8192b-606a-44dc-9453-6d8491c01f30');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', 'a158097f-02b1-4322-9e75-7922702bf4de');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', '3d668620-d47a-47ad-870d-36699faf4a66');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fcb7520f-ffde-4fc6-b870-5293b3813814', '237bbad5-6b12-4506-9af5-3f8ac404f2ad');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', 'c1869a67-4d2b-4adc-901d-123fcd0ad972');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', 'fae4f4de-498e-4760-a84b-4f76a916abfd');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', '2cbb1d92-74bb-4e2b-a479-19234ed62143');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', '237bbad5-6b12-4506-9af5-3f8ac404f2ad');
INSERT INTO public."RestaurantTaxonomy" VALUES ('561c4d10-d81e-42e4-87f0-958a2f854fa1', '3d668620-d47a-47ad-870d-36699faf4a66');
INSERT INTO public."RestaurantTaxonomy" VALUES ('853c16e3-6906-4985-afad-211880a60917', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('853c16e3-6906-4985-afad-211880a60917', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('853c16e3-6906-4985-afad-211880a60917', '62913b4f-eb8d-4d0c-8c86-bb65cb49767c');
INSERT INTO public."RestaurantTaxonomy" VALUES ('145073c9-c134-4ae0-b4e3-3fd81adfb2c9', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('145073c9-c134-4ae0-b4e3-3fd81adfb2c9', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('551b0921-a0e1-479f-94b6-949f91ec7fcf', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('551b0921-a0e1-479f-94b6-949f91ec7fcf', 'ddf50c72-d1a2-472c-abb9-c2ecc8fe06a1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('551b0921-a0e1-479f-94b6-949f91ec7fcf', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('551b0921-a0e1-479f-94b6-949f91ec7fcf', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('f15d5a96-4fbc-4501-8c23-4e4e43a7742e', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '2cbb1d92-74bb-4e2b-a479-19234ed62143');
INSERT INTO public."RestaurantTaxonomy" VALUES ('f15d5a96-4fbc-4501-8c23-4e4e43a7742e', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', '3e21f309-f331-4d43-a58d-ad22fa7ec9ca');
INSERT INTO public."RestaurantTaxonomy" VALUES ('a839c8d2-2a02-40e2-920b-c43c9cda0394', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', 'fae4f4de-498e-4760-a84b-4f76a916abfd');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', '98bdd546-885c-4027-951d-eefa2c493d55');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', '237bbad5-6b12-4506-9af5-3f8ac404f2ad');
INSERT INTO public."RestaurantTaxonomy" VALUES ('4691f3ea-941f-4a28-90a3-e5f02c42018c', '3d668620-d47a-47ad-870d-36699faf4a66');
INSERT INTO public."RestaurantTaxonomy" VALUES ('de8b1efc-02b3-4184-a40e-9991956164ce', '1d6330a7-f7df-4d34-af51-ea9417c38122');
INSERT INTO public."RestaurantTaxonomy" VALUES ('de8b1efc-02b3-4184-a40e-9991956164ce', '3e21f309-f331-4d43-a58d-ad22fa7ec9ca');
INSERT INTO public."RestaurantTaxonomy" VALUES ('de8b1efc-02b3-4184-a40e-9991956164ce', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', 'e631e936-1b8a-43bb-a9a1-63b7cdfe43b1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '76472cb6-3253-4980-b13d-3506f2a18ee1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '2cbb1d92-74bb-4e2b-a479-19234ed62143');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3b42d521-409f-4d8e-a1ee-a0a9e6b9096e', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3da8e4f3-21c8-48e5-9af8-50a930803e78', 'e631e936-1b8a-43bb-a9a1-63b7cdfe43b1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('3da8e4f3-21c8-48e5-9af8-50a930803e78', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('12e5bce4-f71b-4bab-ab29-c35142ef1f3d', 'e631e936-1b8a-43bb-a9a1-63b7cdfe43b1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('12e5bce4-f71b-4bab-ab29-c35142ef1f3d', '237bbad5-6b12-4506-9af5-3f8ac404f2ad');
INSERT INTO public."RestaurantTaxonomy" VALUES ('beb2ee2e-5fa1-48e3-a370-e101c197f5c5', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('beb2ee2e-5fa1-48e3-a370-e101c197f5c5', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b44fd162-5a54-4487-8bf3-d3a37be88ec7', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b44fd162-5a54-4487-8bf3-d3a37be88ec7', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b44fd162-5a54-4487-8bf3-d3a37be88ec7', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ccb963c9-0da1-4961-8e96-98a60d9c5747', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ccb963c9-0da1-4961-8e96-98a60d9c5747', '05418836-6a29-487d-86fd-6d23ca97316d');
INSERT INTO public."RestaurantTaxonomy" VALUES ('ccb963c9-0da1-4961-8e96-98a60d9c5747', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '050574f4-97ed-4b8e-a5d0-36b3b0016bb1');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '2cbb1d92-74bb-4e2b-a479-19234ed62143');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '3f48d104-0b20-49cd-b651-6a9e6ae99a61');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '237bbad5-6b12-4506-9af5-3f8ac404f2ad');
INSERT INTO public."RestaurantTaxonomy" VALUES ('777d3d7b-eeef-4855-82ff-34ed99b572e5', '3d668620-d47a-47ad-870d-36699faf4a66');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '4c32f6ef-7c05-456e-b724-6f166c059a87');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fbf6b622-57cc-43cf-811b-d9d341a0a2d1', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('fbf6b622-57cc-43cf-811b-d9d341a0a2d1', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'cccaefeb-eb23-45d2-beba-79d1370768fb');
INSERT INTO public."RestaurantTaxonomy" VALUES ('0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'abd5e2db-28bb-4576-bd49-2c50d7d1cb21');
INSERT INTO public."RestaurantTaxonomy" VALUES ('0871b5a0-9cc8-46ba-8aff-41e294c4f613', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b74c8030-7571-417a-9b97-e82b80b500a6', '8298de3a-d84c-4fc8-8751-6afb1f007a56');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b74c8030-7571-417a-9b97-e82b80b500a6', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');
INSERT INTO public."RestaurantTaxonomy" VALUES ('b74c8030-7571-417a-9b97-e82b80b500a6', 'ae28a514-16ca-4c1c-9d05-1e862d240abf');
INSERT INTO public."RestaurantTaxonomy" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', '8298de3a-d84c-4fc8-8751-6afb1f007a56');
INSERT INTO public."RestaurantTaxonomy" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', '7bccfdf9-d375-4ec7-9328-49d648b27539');
INSERT INTO public."RestaurantTaxonomy" VALUES ('6d0d7ede-0858-4f7f-a898-1789f7b42df7', '6e60ad56-f7ad-400b-82fe-50f6e0c7e0f0');


--
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Review" VALUES ('6fdbbb58-d5ba-4727-9bcc-342ccf2e4d0a', 5, 'Un poco lentos, pero la comida increible', '{}', '6d0d7ede-0858-4f7f-a898-1789f7b42df7', 'cmju3r7x40001jynhiqbwsno4', '2025-12-31 15:36:32.021', '2025-12-31 15:36:32.021');
INSERT INTO public."Review" VALUES ('3b68bbfa-1777-45aa-bed8-319674b9e1a0', 1, 'Es una mierda', '{}', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'cmju3r7x40001jynhiqbwsno4', '2026-01-05 07:27:59.725', '2026-01-05 07:27:59.725');
INSERT INTO public."Review" VALUES ('48b8df1f-e2ce-4c27-babe-a5c544d4ad2d', 5, '¡Excelente! La pasta estaba deliciosa y el servicio impecable. Volveré sin duda.', '{}', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'user_001', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');
INSERT INTO public."Review" VALUES ('2aa223d7-c2fe-4aa6-a71e-76bdfbc08999', 4, 'Muy buena comida italiana. El tiramisú es espectacular. Un poco caro pero vale la pena.', '{}', '9e6719c7-6d33-4c4b-84eb-83dc3d968d18', 'user_002', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');
INSERT INTO public."Review" VALUES ('12feae8e-70be-4235-b517-a1bbb9fe879d', 5, 'El mejor sushi que he probado en mi vida. Fresco y delicioso.', '{}', 'ea759eee-21b2-4f0a-8df1-d9155ecfb7ee', 'user_001', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');
INSERT INTO public."Review" VALUES ('dbedf32d-d065-4f80-a6f3-d9ad95dc6a0b', 4, 'Tacos auténticos y muy sabrosos. Buen precio.', '{}', 'eb4160e1-2708-466d-bd46-9b33fcaefd80', 'user_002', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');
INSERT INTO public."Review" VALUES ('5f198f84-3316-49f6-8e8e-f259b0ef6b83', 5, 'Las hamburguesas están increíbles. Ingredientes de primera calidad.', '{}', 'fcb7520f-ffde-4fc6-b870-5293b3813814', 'user_001', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');
INSERT INTO public."Review" VALUES ('662c420b-d448-459b-9323-40186b86efce', 5, 'Chuletón espectacular. Ambiente elegante y servicio excelente.', '{}', '561c4d10-d81e-42e4-87f0-958a2f854fa1', 'user_002', '2025-12-31 04:09:03.783', '2025-12-31 04:09:03.783');


--
-- Data for Name: SpecialEvent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: SpecialEventTable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: TableAvailability; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."TableAvailability" VALUES ('0963b0c8-4f88-45e0-a589-993f9a325e54', '2026-01-01 23:00:00', false, '45de265a-6b21-432d-930c-a9e8cf50fc76', 'bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', '2026-01-02 18:59:05.538', '2026-01-02 18:59:05.538');
INSERT INTO public."TableAvailability" VALUES ('b54dea68-ce93-4526-8ae9-042e068e69e0', '2026-01-01 23:00:00', false, '152d7ab8-d71f-4543-b3ee-a7a987f51798', 'bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', '2026-01-02 18:59:14.225', '2026-01-02 18:59:14.225');
INSERT INTO public."TableAvailability" VALUES ('8581072e-9b3c-49fc-a035-264ccd2a1bb4', '2026-01-01 23:00:00', false, '45de265a-6b21-432d-930c-a9e8cf50fc76', '0d16523d-8932-4e51-b98c-4405601b6c65', '2026-01-02 21:42:22.879', '2026-01-02 21:42:22.879');
INSERT INTO public."TableAvailability" VALUES ('d7da5957-5cb6-43b3-8cad-760a5f895b47', '2026-01-04 23:00:00', true, '152d7ab8-d71f-4543-b3ee-a7a987f51798', 'bf1d94ca-4c92-4d07-9cb7-ee1cd835a3da', '2026-01-05 07:05:49.815', '2026-01-05 07:05:53.291');


--
-- Data for Name: TableBlockSchedule; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- PostgreSQL database dump complete
--

\unrestrict cqcfLbEeegQMdWiKOHKwWgbXohQVrEd3VDp4kzsEoIm7K0wnZx9VEFAS6ZusVEJ

