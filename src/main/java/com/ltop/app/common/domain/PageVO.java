package com.ltop.app.common.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
public class PageVO {

	private int pageNum;
	private int amount;
	private int startNum;
	
	public PageVO() {
		this(1, 10);
	}

	public PageVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("startNum", this.startNum);

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
	
}
