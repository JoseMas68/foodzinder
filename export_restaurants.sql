--
-- PostgreSQL database dump
--

\restrict 4CaRcRefuJXdTWdm4qdGqURFCk1XHyzKFrwypbs3B1Jt0HfnEILUhHebTwHtLbI

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
-- PostgreSQL database dump complete
--

\unrestrict 4CaRcRefuJXdTWdm4qdGqURFCk1XHyzKFrwypbs3B1Jt0HfnEILUhHebTwHtLbI

