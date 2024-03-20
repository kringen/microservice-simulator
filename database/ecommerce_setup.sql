CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
-- prompt:
generate data for a product table with the following fields:  name, description, status (active, active, active), category, and subcategory, Create 200 products that would be sold on a robot and electronics enthusiast website, where customers can purchase components and kits to build robots and also to purchase clothing, stickers, and hats.  Each product name should be unique and sensible based upon their category and subcategory.  Each product description should also be catchy and inspire customers to add the product to their collection, project.  Output should be in the format of postgresql insert statements.
*/

INSERT INTO products (name, description, status, category, subcategory) VALUES ('RoboKitMaster300', 'Unleash the potential of robotics with our RoboKitMaster300. Perfect for any enthusiast!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('SensorArrayPro200', 'Elevate your projects with our SensorArrayPro200 – precision engineering for innovators!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('CircuitWizard500', 'CircuitWizard500: The ultimate controller for your custom robot designs!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('TechTeeConnector', 'Wear the passion of building with our TechTeeConnector, the t-shirt that speaks to your maker soul!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('CapacitorCapClassic', 'CapacitorCapClassic: Top off your look with a cap thats charged with style!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RoboRangerX900', 'Explore the edge of innovation with RoboRangerX900, your ultimate robotics companion!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('CircuitBeast5000', 'Unleash the power of electronics with CircuitBeast5000, the heart of your next project!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('QuantumJumper200', 'Leap into the future with QuantumJumper200, the essential component for advanced robotics!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('GearGuruHat', 'Top your tech-savvy look with GearGuruHat, the perfect blend of style and electronics passion!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('BoltBrigadeTee', 'Join the BoltBrigade with this tee, where fashion meets function in robotics!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors239', 'Elevate your projects with our ComponentsMotors239 – precision engineering for innovators!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts854', 'Wear the passion of building with our ClothingT-Shirts854, the t-shirt that speaks to your maker soul!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers712', 'Show off your builders pride with MerchandiseStickers712, perfect for laptops and toolboxes!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries368', 'Embark on a journey of discovery with RobotKitsExplorerSeries368, your gateway to robotics exploration!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech945', 'Push the boundaries of possibility with ComponentsQuantumTech945, the future of robotics tech!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories529', 'Accessorize your tech lifestyle with ClothingAccessories529, blending fashion and function!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters198', 'Decorate your space with MerchandisePosters198, inspiring your next big project!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit762', 'Take your skills to the next level with RobotKitsIntermediateKit762, designed for passionate builders!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors641', 'Capture the world in detail with ComponentsSensors641, the sensor that sees it all!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats276', 'Cap off your creative day with ClothingHats276, where style meets your maker spirit!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RoboGearExplorer', 'Discover the uncharted with RoboGearExplorer, your perfect companion for robotic adventures!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('QuantumProcessor2020', 'QuantumProcessor2020: The brain for your futuristic projects!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('CircuitSynthGlove', 'CircuitSynthGlove: Feel the power of technology at your fingertips!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('NanoDroneVision', 'Elevate your view with NanoDroneVision, the ultimate eye in the sky!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('BionicActuatorArm', 'BionicActuatorArm: Enhance your robotics with precision and strength!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors646', 'A must-have for every robotics aficionado!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries981', 'Embark on a journey of discovery with this essential kit!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats264', 'Blend your passion for tech with everyday style!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers739', 'Make a statement with this tech-inspired gear!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech857', 'The cornerstone of any great invention!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit925', 'Bring your ideas to life with this essential kit!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories317', 'Where fashion and function collide!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters546', 'Capture the essence of innovation with this product!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsControllers682', 'Precision and performance at your fingertips!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsAdvancedKit748', 'Unleash your creativity with this top-notch tech!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts473', 'The ultimate solution for your robotics needs!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseHats291', 'Style meets technology in this unique piece!', 'active', 'Merchandise', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors528', 'Innovate and create with the best in tech!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit764', 'Elevate your project with cutting-edge technology!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories839', 'The perfect addition to your makers toolkit!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit680', 'The ultimate solution for your robotics needs!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsControllers982', 'Precision and performance at your fingertips!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats264', 'Style meets technology in this unique piece!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers739', 'Make a statement with this tech-inspired gear!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech857', 'The cornerstone of any great invention!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries981', 'Embark on a journey of discovery with this essential kit!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories317', 'Where fashion and function collide!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters546', 'Capture the essence of innovation with this product!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors528', 'Innovate and create with the best in tech!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit764', 'Elevate your project with cutting-edge technology!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts473', 'The perfect addition to your makers toolkit!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseHats291', 'Unleash the potential of robotics with our latest product.', 'active', 'Merchandise', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors646', 'A must-have for every robotics aficionado!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsAdvancedKit748', 'Bring your ideas to life with this essential kit!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories839', 'Blend your passion for tech with everyday style!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories160', 'Make a statement with this tech-inspired gear!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsControllers982', 'Precision and performance at your fingertips!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries981', 'Embark on a journey of discovery with this essential kit!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers739', 'Capture the essence of innovation with this product!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech857', 'The cornerstone of any great invention!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats264', 'Style meets technology in this unique piece!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit680', 'The ultimate solution for your robotics needs!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters546', 'Decorate your space with inspiring tech art!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors528', 'Innovate and create with the best in tech!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit764', 'Elevate your project with cutting-edge technology!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts473', 'Blend your passion for tech with everyday style!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseHats291', 'Unleash the potential of robotics with our latest product.', 'active', 'Merchandise', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors646', 'A must-have for every robotics aficionado!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsAdvancedKit748', 'Bring your ideas to life with this essential kit!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories839', 'Accessorize your tech lifestyle with this product!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries368', 'Embark on a journey of discovery with RobotKitsExplorerSeries368, your gateway to robotics exploration!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech945', 'Push the boundaries of possibility with ComponentsQuantumTech945, the future of robotics tech!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories529', 'Accessorize your tech lifestyle with ClothingAccessories529, blending fashion and function!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters198', 'Decorate your space with MerchandisePosters198, inspiring your next big project!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit762', 'Take your skills to the next level with RobotKitsIntermediateKit762, designed for passionate builders!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors641', 'Capture the world in detail with ComponentsSensors641, the sensor that sees it all!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats276', 'Cap off your creative day with ClothingHats276, where style meets your maker spirit!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit880', 'Introducing RobotKitsBeginnerKit880, the perfect addition to your robot kits collection!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors123', 'Introducing ComponentsSensors123, the perfect addition to your components collection!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats456', 'Introducing ClothingHats456, the perfect addition to your clothing collection!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers789', 'Introducing MerchandiseStickers789, the perfect addition to your merchandise collection!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries112', 'Introducing RobotKitsExplorerSeries112, the perfect addition to your robot kits collection!', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech234', 'Introducing ComponentsQuantumTech234, the perfect addition to your components collection!', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts567', 'Introducing ClothingT-Shirts567, the perfect addition to your clothing collection!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters890', 'Introducing MerchandisePosters890, the perfect addition to your merchandise collection!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit345', 'Introducing RobotKitsIntermediateKit345, the perfect addition to your robot kits collection!', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsControllers678', 'Introducing ComponentsControllers678, the perfect addition to your components collection!', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories901', 'Introducing ClothingAccessories901, the perfect addition to your clothing collection!', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseHats234', 'Introducing MerchandiseHats234, the perfect addition to your merchandise collection!', 'active', 'Merchandise', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsAdvancedKit567', 'Introducing RobotKitsAdvancedKit567, the perfect addition to your robot kits collection!', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors890', 'Introducing ComponentsMotors890, the perfect addition to your components collection!', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats123', 'Introducing ClothingHats123, the perfect addition to your clothing collection!', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers456', 'Introducing MerchandiseStickers456, the perfect addition to your merchandise collection!', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit789', 'Introducing RobotKitsBeginnerKit789, the perfect addition to your robot kits collection!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors234', 'Introducing ComponentsSensors234, the perfect addition to your components collection!', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts890', 'Introducing ClothingT-Shirts890, the perfect addition to your clothing collection!', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters123', 'Introducing MerchandisePosters123, the perfect addition to your merchandise collection!', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit349', 'The perfect addition to your robotics journey, the BeginnerKit349 is a must-have!', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsControllers856', 'Controllers856 - A powerhouse for precision and control in your electronic creations.', 'active', 'Components', 'Controllers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats412', 'Hats412 - Fashion meets function, a stylish way to express your love for robotics.', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers207', 'Stickers207 - Adorn your gear with stickers that showcase your builder spirit.', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsExplorerSeries528', 'ExplorerSeries528 - Explore the limits of your creativity with our advanced robot kit.', 'active', 'Robot Kits', 'Explorer Series');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsQuantumTech634', 'QuantumTech634 - Dive into the future of robotics with our cutting-edge quantum components.', 'active', 'Components', 'Quantum Tech');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts918', 'T-Shirts918 - Wear your passion on your sleeve with our exclusive robotics-themed tees.', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters305', 'Posters305 - Inspire your next project with posters that fuel your innovative fire.', 'active', 'Merchandise', 'Posters');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsIntermediateKit472', 'IntermediateKit472 - Perfect your skills with a kit designed for the aspiring robot builder.', 'active', 'Robot Kits', 'Intermediate Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors953', 'Sensors953 - Sensitivity meets accuracy in our top-of-the-line sensors for any project.', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingAccessories764', 'Accessories764 - Accessorize your tech life with gadgets that complement your style.', 'active', 'Clothing', 'Accessories');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseHats593', 'Hats593 - Cap off your look with a hat thats as smart as the tech you love.', 'active', 'Merchandise', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsAdvancedKit861', 'AdvancedKit861 - Challenge yourself with a kit that takes your robotics to the next level.', 'active', 'Robot Kits', 'Advanced Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsMotors479', 'Motors479 - Power up your projects with motors that offer unmatched performance.', 'active', 'Components', 'Motors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingHats358', 'Hats358 - A hat that blends seamlessly with your tech-savvy lifestyle.', 'active', 'Clothing', 'Hats');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandiseStickers641', 'Stickers641 - Show off your tech enthusiasm with stickers that say it all.', 'active', 'Merchandise', 'Stickers');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('RobotKitsBeginnerKit275', 'BeginnerKit275 - Start your robotics adventure with a kit thats perfect for beginners.', 'active', 'Robot Kits', 'Beginner Kit');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ComponentsSensors682', 'Sensors682 - The ultimate sensors for precision in your electronic projects.', 'active', 'Components', 'Sensors');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('ClothingT-Shirts419', 'T-Shirts419 - Express your inner engineer with our custom-designed robotics tees.', 'active', 'Clothing', 'T-Shirts');
INSERT INTO products (name, description, status, category, subcategory) VALUES ('MerchandisePosters874', 'Posters874 - Decorate your workspace with posters that inspire innovation and creativity.', 'active', 'Merchandise', 'Posters');




CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    tracking_number VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shopping_cart (
    cart_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prices (
    product_id INT PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    effective_date DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    quantity_available INT NOT NULL,
    warehouse_location VARCHAR(50),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
-- prompt:
generate the data for an inventory table with the following columns: product_id (range: 1-100), reorder_level (range: 100-1000), qty_available (within the range of reorder_level, qty_reserved (range: 1-100), and warehouse_id (range: 1-3).  The output should be in the format of postgresql insert statements.  Generate 100 records
*/

INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (47, 905, 555, 41, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (93, 583, 413, 77, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (45, 841, 594, 11, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (76, 456, 228, 22, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (58, 789, 394, 78, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (90, 654, 327, 89, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (23, 321, 160, 80, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (34, 876, 438, 43, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (12, 432, 216, 21, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (67, 987, 493, 74, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (89, 210, 105, 88, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (56, 543, 271, 55, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (32, 765, 382, 31, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (14, 678, 339, 13, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (25, 890, 445, 24, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (37, 345, 172, 36, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (48, 567, 283, 47, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (59, 678, 339, 58, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (71, 789, 394, 70, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (82, 890, 445, 81, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (94, 321, 160, 93, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (92, 859, 430, 95, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (72, 533, 305, 62, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (18, 654, 327, 18, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (34, 775, 387, 34, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (56, 886, 443, 56, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (78, 997, 498, 78, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (12, 110, 55, 12, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (23, 221, 110, 23, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (45, 332, 166, 45, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (67, 443, 221, 67, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (89, 554, 277, 89, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (10, 665, 332, 10, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (32, 776, 388, 32, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (54, 887, 443, 54, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (76, 998, 499, 76, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (98, 109, 54, 98, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (21, 220, 110, 21, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (43, 331, 165, 43, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (65, 442, 221, 65, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (87, 553, 276, 87, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (9, 664, 332, 9, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (31, 775, 387, 31, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (53, 886, 443, 53, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (75, 997, 498, 75, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (97, 108, 54, 97, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (20, 219, 109, 20, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (42, 330, 165, 42, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (64, 441, 220, 64, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (86, 552, 276, 86, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (8, 663, 331, 8, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (30, 774, 387, 30, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (99, 361, 295, 32, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (85, 462, 231, 85, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (73, 563, 282, 73, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (61, 664, 332, 61, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (49, 765, 383, 49, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (37, 866, 433, 37, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (25, 967, 484, 25, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (13, 1068, 534, 13, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (1, 169, 84, 1, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (88, 270, 135, 88, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (76, 371, 185, 76, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (64, 472, 236, 64, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (52, 573, 286, 52, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (40, 674, 337, 40, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (28, 775, 387, 28, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (16, 876, 438, 16, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (4, 977, 488, 4, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (91, 178, 89, 91, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (79, 279, 139, 79, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (67, 380, 190, 67, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (55, 481, 240, 55, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (43, 582, 291, 43, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (31, 683, 341, 31, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (19, 784, 392, 19, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (7, 885, 442, 7, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (94, 986, 493, 94, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (82, 187, 93, 82, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (70, 288, 144, 70, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (58, 389, 194, 58, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (46, 490, 245, 46, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (34, 591, 295, 34, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (22, 692, 346, 22, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (10, 793, 396, 10, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (97, 894, 447, 97, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (85, 995, 497, 85, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (73, 196, 98, 73, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (61, 297, 148, 61, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (49, 398, 199, 49, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (37, 499, 249, 37, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (25, 600, 300, 25, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (93, 212, 158, 87, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (88, 345, 172, 44, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (77, 876, 438, 21, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (66, 432, 216, 12, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (55, 543, 272, 55, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (44, 654, 327, 44, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (33, 765, 383, 33, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (22, 876, 438, 22, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (11, 987, 494, 11, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (99, 198, 99, 99, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (88, 309, 155, 88, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (77, 420, 210, 77, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (66, 531, 266, 66, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (55, 642, 321, 55, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (44, 753, 377, 44, 3);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (33, 864, 432, 33, 1);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (22, 975, 488, 22, 2);
INSERT INTO inventory (product_id, reorder_level, qty_available, qty_reserved, warehouse_id) VALUES (11, 186, 93, 11, 3);

