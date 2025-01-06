soccer_2 <- soccer %>% 
  rename(full_time_home_goals = FTHG,
         full_time_away_goals = FTAG,
         full_time_result = FTR,
         halftime_home_goals = HTHG,
         halftime_away_goals = HTAG,
         halftime_results = HTR, 
         shots_home = HS,
         shots_away = AS,
         shots_goal_home = HST,
         shots_goal_away = AST,
         fouls_home = HF,
         fouls_away = AF,
         corners_home = HC,
         corners_away = AC,
         yellow_home = HY,
         yellow_away = AY,
         red_home = HR,
         red_away = AR) %>% 
  mutate(percent_shots_goal_home = 100 * (shots_goal_home/(shots_goal_home + shots_goal_away)),
         percent_shots_goal_away = 100 * (shots_goal_away/(shots_goal_home + shots_goal_away))) %>% 
  select(-full_time_away_goals, -full_time_home_goals)
