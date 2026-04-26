# Installera (bara första gången)
install.packages(c("tidyverse","janitor","skimr"))

# Ladda
library(tidyverse)
library(janitor)
library(skimr)

# =========================
# 2. LOAD DATA
# =========================

df <- read_csv("data/insurance_costs.csv") %>%
  clean_names()

# Kolla struktur
glimpse(df)

# Sammanfattning
summary(df)

# Saknade värden
colSums(is.na(df))


# Djupare analys
skim(df)

# =========================
# 3. HANDLE MISSING VALUES
# =========================

# BMI (numerisk → median)
df$bmi[is.na(df$bmi)] <- median(df$bmi, na.rm = TRUE)

# Exercise level (kategorisk → "unknown")
df$exercise_level[is.na(df$exercise_level)] <- "unknown"

# Annual checkups (numerisk → median)
df$annual_checkups[is.na(df$annual_checkups)] <- median(df$annual_checkups, na.rm = TRUE)

# Kontrollera att allt är fixat
colSums(is.na(df))



# =========================
# 4. DATA CLEANING
# =========================

df <- df %>%
  mutate(
    smoker = tolower(smoker)  # gör allt till små bokstäver
  )


df <- df %>%
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region),
    exercise_level = as.factor(exercise_level),
    plan_type = as.factor(plan_type),
    chronic_condition = as.factor(chronic_condition)
  )


# =========================
# 5. FEATURE ENGINEERING
# =========================

df <- df %>%
  mutate(
    bmi_category = case_when(
      bmi < 18.5 ~ "underweight",
      bmi < 25 ~ "normal",
      bmi < 30 ~ "overweight",
      TRUE ~ "obese"
    ),
    
    age_group = case_when(
      age < 30 ~ "young",
      age < 50 ~ "middle",
      TRUE ~ "older"
    ),
    
    risk_score = prior_accidents + prior_claims
  )


# =========================
# 6. DESCRIPTIVE ANALYSIS
# =========================

# Histogram av kostnader
hist_plot <- ggplot(df, aes(x = charges)) +
  geom_histogram(bins = 30) +
  ggtitle("Distribution of Insurance Charges")
# Fördelningen av kostnader är högerskev, 
# med många låga värden och några mycket höga
ggsave("output/charges_hist.png", plot = hist_plot, width = 6, height = 4)



# Smoker vs kostnad
smoker_plot <- ggplot(df, aes(x = smoker, y = charges)) +
  geom_boxplot() +
  ggtitle("Smoker vs Charges")
# Rökare har tydligt högre kostnader och större spridning än icke-rökare
ggsave("output/smoker_vs_charges.png", plot = smoker_plot, width = 6, height = 4)


# BMI vs kostnad
bmi_plot <- ggplot(df, aes(x = bmi, y = charges)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  ggtitle("BMI vs Charges")
# Det finns ett svagt positivt samband mellan BMI och kostnader, 
# men med stor variation
ggsave("output/bmi_vs_charges.png", plot = bmi_plot, width = 6, height = 4)



# Exercise level vs kostnad
exercise_plot <- ggplot(df, aes(x = exercise_level, y = charges)) +
  geom_boxplot() +
  ggtitle("Exercise Level vs Charges")
# Lägre aktivitetsnivå verkar vara kopplad till något högre kostnader, 
# men skillnaderna är måttliga
ggsave("output/exercise_vs_charges.png", plot = exercise_plot, width = 6, height = 4)



# Risk score vs kostnad
risk_score_plot <- ggplot(df, aes(x = risk_score, y = charges)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  ggtitle("Risk Score vs Charges")

# Kostnader ökar med högre risk score, vilket tyder på ett positivt samband
ggsave("output/risk_score_vs_charges.png", plot = risk_score_plot, width = 6, height = 4)




# Den inledande analysen tyder på att 
# rökning, BMI och riskhistorik är viktiga faktorer för kostnader

# =========================
# 7. REGRESSIONSMODELL (G-nivå)
# =========================

# Enkel modell
model <- lm(charges ~ age + bmi + smoker + children, data = df)

summary(model)

# -------------------------
# Tolkning (kort)
# -------------------------

# Age har ett positivt samband med kostnader
# BMI har ett svagt positivt samband
# Rökning har en stark effekt på kostnader
# Antal barn har liten eller begränsad påverkan

# De mest betydelsefulla variablerna verkar vara rökning och ålder

#Csv med clean data
write.csv(df, "output/cleaned_data.csv")


