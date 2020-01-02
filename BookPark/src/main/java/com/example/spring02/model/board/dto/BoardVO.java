package com.example.spring02.model.board.dto;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	private int bno;			// 寃뚯떆湲� 踰덊샇
	private String title;		// 寃뚯떆湲� �젣紐�
	private String content;		// 寃뚯떆湲� �궡�슜
	private String writer;		// 寃뚯떆湲� �옉�꽦�옄
	private String userName;	// 寃뚯떆湲� �옉�꽦�옄�쓽 �씠由�(�쉶�썝�씠由�)
	private Date regdate;		// 寃뚯떆湲� �옉�꽦�씪�옄 util.Date
	private int viewcnt;		// 寃뚯떆湲� 議고쉶�닔
	private int recnt;			// 寃뚯떆湲� �뙎湲��쓽 �닔 
	private String showd;		// 寃뚯떆湲� �궘�젣 �긽�깭 �쑀臾�(y, n)
	private String[] files;		// 寃뚯떆湲� 泥⑤��뙆�씪�쓽 �씠由�(諛곗뿴)
	// Getter/Setter
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	
	public String getShow() {
		return showd;
	}
	
	public void setShow(String show) {
		this.showd = showd;
	}
	
	public String[] getFiles() {
		return files;
	}
	
	public void setFiles(String[] files) {
		this.files = files;
	}
	// toString()
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", userName=" + userName + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", recnt=" + recnt
				+ ", show=" + showd + ", files=" + Arrays.toString(files) + "]";
	}
}