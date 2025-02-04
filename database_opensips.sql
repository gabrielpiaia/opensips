CREATE DATABASE opensips

grant all *.* opensips@opensips senha opensips

GRANT ALL PRIVILEGES ON *.* TO 'opensips'@'localhost' IDENTIFIED BY 'opensips' WITH GRANT OPTION;



#### TABELAS PARA O MODULO DR_ROUTING

CREATE TABLE dr_carriers (
    carrierid INT UNSIGNED NOT NULL,
    PRIMARY KEY (carrierid),
    UNIQUE KEY dr_carrier_idx (carrierid)
);

CREATE TABLE dr_groups (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(64) NOT NULL,
    domain VARCHAR(128) DEFAULT NULL,
    groupid INT UNSIGNED NOT NULL DEFAULT 0,
    description VARCHAR(128) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE dr_gateways (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    gwid VARCHAR(64) NOT NULL,
    type INT UNSIGNED NOT NULL DEFAULT 0,
    address VARCHAR(128) NOT NULL,
    strip INT UNSIGNED NOT NULL DEFAULT 0,
    pri_prefix VARCHAR(16) DEFAULT NULL,
    attrs VARCHAR(255) DEFAULT NULL,
    probe_mode INT UNSIGNED NOT NULL DEFAULT 0,
    state INT UNSIGNED NOT NULL DEFAULT 0,
    socket VARCHAR(128) DEFAULT NULL,
    description VARCHAR(128) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY dr_gw_idx (gwid)
);

CREATE TABLE dr_rules (
    ruleid INT UNSIGNED NOT NULL AUTO_INCREMENT,
    groupid VARCHAR(255) NOT NULL,
    prefix VARCHAR(64) NOT NULL,
    timerec VARCHAR(255) DEFAULT NULL,
    priority INT NOT NULL DEFAULT 0,
    routeid VARCHAR(255) DEFAULT NULL,
    gwlist VARCHAR(255) DEFAULT NULL,
    sort_alg CHAR(1) NOT NULL DEFAULT 'N',
    sort_profile INT UNSIGNED DEFAULT NULL,
    attrs VARCHAR(255) DEFAULT NULL,
    description VARCHAR(128) DEFAULT NULL,
    PRIMARY KEY (ruleid)
);


#### table_version

CREATE TABLE version (
    table_name VARCHAR(32) NOT NULL,
    table_version INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (table_name),
    UNIQUE KEY t_name_idx (table_name)
);



CREATE TABLE rtpengine (
    id UNSIGNED INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    socket TEXT NOT NULL,
    set_id UNSIGNED INT(10) NOT NULL
);


CREATE TABLE dispatcher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setid INT NOT NULL,
    destination VARCHAR(128) NOT NULL,
    flags INT DEFAULT 0 NOT NULL,
    priority INT DEFAULT 0 NOT NULL,
    attrs VARCHAR(128),
    description VARCHAR(64)
);


CREATE TABLE clusterer (
    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cluster_id INT(10) NOT NULL,
    node_id INT(10) NOT NULL,
    url VARCHAR(64) NOT NULL,
    state INT(1) DEFAULT 1 NOT NULL,
    no_ping_retries INT(10) DEFAULT 3 NOT NULL,
    priority INT(10) DEFAULT 50 NOT NULL,
    sip_addr VARCHAR(64) DEFAULT NULL,
    flags VARCHAR(64) DEFAULT NULL,
    description VARCHAR(64) DEFAULT NULL,
    UNIQUE KEY clusterer_idx (cluster_id, node_id)
);
