CREATE TABLE board_reply
(
	reply_no INT PRIMARY KEY AUTO_INCREMENT,
	board_no INT NOT NULL DEFAULT 0,
	reply_text VARCHAR(1000) NOT NULL,
	reply_writer VARCHAR(50) NOT NULL,
	reg_date TIMESTAMP NOT NULL DEFAULT NOW(),
	update_date TIMESTAMP NOT NULL DEFAULT NOW()
);

ALTER TABLE board_reply ADD CONSTRAINT FK_BOARD
FOREIGN KEY(board_no) REFERENCES mvc_board(board_no);

SELECT * FROM board_reply WHERE board_no=3000 order by reply_no desc;

alter table mvc_board add column reply_cnt int default 0;