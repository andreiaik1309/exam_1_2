CREATE TABLE IF NOT EXISTS it_vacancies (
    `Ids`    Int64,
    `Employer`   String,
    `Name`  String,
    `Salary`  Bool,
    `From`  Nullable(Float32),
    `To` Nullable(Float32),
    `Experience` String,
    `Schedule` String,
    `Keys` String,
    `Description` String,
    `Area` String,
    `Professional roles` String,
    `Specializations` String,
    `Profarea names` String,
    `Published at` String
) ENGINE = MergeTree()
ORDER BY (`Ids`)
;