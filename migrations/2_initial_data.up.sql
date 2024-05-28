-- projects table
INSERT INTO
  projects (id, name)
VALUES
  (1, 'NEP');


-- slack_conversations table
INSERT INTO
  slack_conversations (id, project_id, chat_id, last_updated)
VALUES
  (1, 1, 'C04PSEQPFEE', '1679415603.000000'),
  (2, 1, 'C04ML19DDHD', '1679415603.000000'),
  (3, 1, 'C04G519L3DK', '1679415603.000000');