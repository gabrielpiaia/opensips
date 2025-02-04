CREATE TABLE version (
    table_name VARCHAR(32) NOT NULL,
    table_version INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (table_name),
    UNIQUE KEY t_name_idx (table_name)
);


#### MODULO DROUTING

INSERT INTO version (table_name, table_version)  
VALUES ('dr_gateways', 6);

INSERT INTO version (table_name, table_version)  
VALUES ('dr_rules', 4);

INSERT INTO version (table_name, table_version)  
VALUES ('dr_groups', 2);

INSERT INTO version (table_name, table_version)  
VALUES ('dr_carriers', 3);

####################