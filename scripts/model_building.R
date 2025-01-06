# Make sure the full time result variable is a factor variable
soccer_2 <- soccer_2 %>% 
  mutate(full_time_result = as.factor(full_time_result))

# STEP 1: Model Specification
rf_spec <- rand_forest()  %>%
  set_mode("classification") %>%
  set_engine(engine = "ranger") %>% 
  set_args(
    mtry = NULL,
    trees = 500,
    min_n = 2,
    probability = FALSE, 
    importance = "impurity"
  )

# STEP 2: Build a random forest
ensemble_model <- rf_spec %>% 
  fit(full_time_result ~ halftime_results + shots_goal_home + shots_goal_away, data = soccer_2)


ensemble_model_2 <- rf_spec %>% 
  fit(full_time_result ~ ., data = soccer_2)

# Plot the metrics
ensemble_model_2 %>% 
  vip(geom = "point", num_features = 32)

# OOB confusion matrix
ensemble_model %>% 
  extract_fit_engine() %>% 
  pluck("confusion.matrix") %>% 
  t()


