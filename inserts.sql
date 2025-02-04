INSERT INTO rtpengine (socket, name, type, set_id, active, external, internal, port_min, port_max)  
VALUES ('udp:127.0.0.1:7890', 'RTP', 1, 1, 1, NULL, NULL, 10000, 20000);


INSERT INTO rtpengine (socket, set_id)  
VALUES ('udp:127.0.0.1:7890', 1);




INSERT INTO dialplan (dpid, pr, match_op, match_exp, match_flags, subst_exp, repl_exp, timerec, disabled, attrs) 
VALUES (1, 0, 1, '^1[0-9]*', 1, '^(1)([0-9]*)', '\\2', NULL, 0, '66.165.255.4');


INSERT INTO dialplan (dpid, pr, match_op, match_exp, match_flags, subst_exp, repl_exp, timerec, disabled, attrs) 
VALUES (1, 0, 1, '^4[0-9]*', 1, '^(4)([0-9]*)', '\\2', NULL, 0, '66.165.255.4');