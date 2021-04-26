SELECT * FROM BOARDS
WHERE NVL(TITLE,' ') LIKE "%"|| :IN_TITLE ||"%"
;-- 모든 값을 찾고 싶은데 NULL 필드일 경우