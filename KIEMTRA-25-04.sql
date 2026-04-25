CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    customer_type ENUM('Normal', 'VIP') DEFAULT 'Normal'
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('completed', 'cancelled') DEFAULT 'completed',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO customers (full_name, phone, address, customer_type) VALUES
('Nguyen Van An',   '0901111111', 'Ha Noi',    'VIP'),
('Tran Thi Bich',   '0902222222', 'Ho Chi Minh', 'VIP'),
('Le Van Cuong',    '0903333333', 'Da Nang',   'Normal'),
('Pham Thi Dung',   '0904444444', 'Hue',       'Normal'),
('Hoang Van Em',    '0905555555', 'Can Tho',   'Normal'),

('Nguyen Thi Phuong', '0906666666', 'Ninh Binh', 'Normal'),
('Tran Van Quoc',   '0907777777', 'Hai Phong', 'Normal');



INSERT INTO products (product_name, category, price, stock) VALUES

('Điện thoại Samsung A54', 'Điện tử', 8500000, 50),
('Tai nghe Bluetooth',     'Điện tử', 350000,  30),
('Cáp sạc Type-C',         'Điện tử', 80000,   100),

('Áo thun nam',            'Quần áo', 150000,  80),
('Quần jean nữ',           'Quần áo', 350000,  60),
('Áo khoác hoodie',        'Quần áo', 450000,  0),  

('Cà phê hòa tan G7',      'Thực phẩm', 95000,  200),
('Trà xanh Lipton',        'Thực phẩm', 45000,  150),
('Bánh quy Oreo',          'Thực phẩm', 35000,  300),
('Nước suối Lavie',        'Thực phẩm', 15000,  500);


INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-01-10', 'completed'),
(2, '2024-01-15', 'completed'),
(3, '2024-01-20', 'cancelled'), 
(4, '2024-02-01', 'completed'),
(5, '2024-02-05', 'completed');

INSERT INTO order_details (order_id, product_id, quantity, total_price) VALUES

(1, 1, 1, 8500000),
(1, 2, 2, 700000),
(1, 3, 3, 240000),

(2, 4, 3, 450000),
(2, 5, 1, 350000),

(3, 7, 5, 475000),
(3, 8, 2, 90000),

(4, 9, 4, 140000),
(4, 10, 6, 90000),

(5, 1, 1, 8500000),
(5, 6, 2, 900000),
(5, 2, 1, 350000);


UPDATE products
SET stock = stock - 5
WHERE id = 1;