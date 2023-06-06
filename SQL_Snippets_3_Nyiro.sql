-- Fictional databases
-- We have two working teams (prio and backup teams) who deliver the installation of construction elements.
-- We have separate databases about their activities, the sum of money they won back after solving a technical problem
-- Additional to their main-team duties where they won back 30%, every team works as a backup team, too - 
--where they won back an additional 10% of the damage losses. 
-- TASK: which team won back the most damage losses (in $) and how much did they win back exactly?

SELECT prio_team, Prio.won_back_value + Backup.won_back_value_2 AS total_won_back
FROM
  (SELECT prio_team, (SUM (loss))*0.3 AS won_back_value 
  FROM solar_losses
  FULL JOIN solar_teams
  ON solar_losses.error_code = solar_teams.error_code
  GROUP BY prio_team) AS Prio
JOIN
  (SELECT backup_team, (SUM (loss))*0.1 AS won_back_value_2
  FROM solar_losses
  FULL JOIN solar_teams
  ON solar_losses.error_code = solar_teams.error_code
  GROUP BY backup_team) AS Backup
  ON Prio.prio_team = Backup.backup_team
ORDER BY total_won_back DESC;








































