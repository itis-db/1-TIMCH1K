WITH RECURSIVE activity_hierarchy AS (
    SELECT a.activityid, a.activitytypeid, a.code, a.name, a.parentid, at.sysname,
           1 AS level
    FROM activity a
             JOIN activitytype at ON a.activitytypeid = at.activitytypeid
WHERE a.parentid IS NULL
UNION ALL
SELECT a.activityid, a.activitytypeid, a.code, a.name, a.parentid, at.sysname,
       ah.level + 1
FROM activity a
         JOIN activitytype at ON a.activitytypeid = at.activitytypeid
    JOIN activity_hierarchy ah ON a.parentid = ah.activityid
    )
SELECT
    ah.activityid,
    ah.activitytypeid,
    ah.code,
    ah.name,
    ah.parentid,
    ah.sysname AS type,
    CASE
        WHEN ah.sysname = 'AreaVariant' THEN ar.name
        ELSE NULL
        END AS territory,
    ah.level
FROM activity_hierarchy ah
         LEFT JOIN area ar ON ah.activityid = ar.areaid
WHERE ah.level <= 5
ORDER BY ah.level, ah.activityid;
