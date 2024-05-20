DECLARE @output NVARCHAR(MAX) = '';
DECLARE @n INT;
DECLARE @counter BIT;
DECLARE @a INT;
DECLARE @b INT;

SET @n = 2;

WHILE @n <= 1000
BEGIN
    SET @counter = 0;
    SET @a = FLOOR(@n / 2);
    SET @b = 2;

    WHILE @b <= @a
    BEGIN
        IF (@n % @b = 0)
        BEGIN
            SET @counter = 1;
        END
        SET @b = @b + 1;
    END

    IF (@counter = 0)
    BEGIN
        SET @output = @output + CAST(@n AS NVARCHAR) + '&';
    END

    SET @n = @n + 1;
END

SET @output = LEFT(@output, LEN(@output) - 1);

PRINT @output;
