SELECT PDNAME, PDSUBNAME, FACNAME, STONAME, NVL(STAMOUNT, 0)
FROM PRODUCT
LEFT JOIN STORE USING (PDNO)
LEFT JOIN FACTORY USING (FACTNO)
WHERE FACLOC = 'SEOUL'
AND STAMOUNT IS NULL;