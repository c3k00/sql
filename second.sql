DELIMITER //
CREATE PROCEDURE second_counter(num INT)
BEGIN
    CASE
        WHEN num < 60 THEN
            SELECT CONCAT(num, ' ', 'секунд') AS Result;
        WHEN num >= 60 AND num < 3600 THEN
            SELECT CONCAT_WS(' ', num DIV 60, 'минут', MOD(num, 60), 'секунд') AS Result;
        WHEN num >= 3600 AND num < 86400 THEN
            SELECT CONCAT_WS(' ', num DIV 3600, 'часов', MOD(num, 3600) DIV 60, 'минут', MOD(MOD(num, 3600), 60), 'секунд') AS Result;
        ELSE
            SELECT CONCAT_WS(' ', num DIV 86400, 'дней', MOD(num, 86400) DIV 3600, 'часов', MOD(MOD(num, 86400), 3600) DIV 60, 'минут', MOD(MOD(MOD(num, 86400), 3600), 60), 'секунд') AS Result;
    END CASE;
END //
DELIMITER ;

-- Пример вызова:
CALL second_counter(123456);

