CREATE TABLE IF NOT EXISTS `police_records` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizen_id` VARCHAR(50) NOT NULL,
    `officer_id` VARCHAR(50) NOT NULL,
    `reason` TEXT NOT NULL,
    `time` INT NOT NULL,
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
