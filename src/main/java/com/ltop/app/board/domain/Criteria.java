package com.ltop.app.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
public class Criteria {

	private int pageNum;
	private int amount;
	private int startNum;

	private String searchTitle;
	private String searchContent;
	private String searchWriter;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("startNum", this.startNum)
				.queryParam("searchTitle", this.getSearchTitle())
				.queryParam("searchContent", this.getSearchContent())
				.queryParam("searchWriter", this.getSearchWriter());

		return builder.toUriString();
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public int getStartNum() {
		return (this.pageNum-1)*10;
	}

	public String getSearchTitle() {
		return searchTitle;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public String getSearchWriter() {
		return searchWriter;
	}
	
}
