package cn.springmvc.model;

import java.util.Date;

public class Card {
	private Integer cardId;

	private String cardNo;

	private String cardBank;

	private String cardType;

	private Date cardAddDate;

	public Integer getCardId() {
		return cardId;
	}

	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo == null ? null : cardNo.trim();
	}

	public String getCardBank() {
		return cardBank;
	}

	public void setCardBank(String cardBank) {
		this.cardBank = cardBank == null ? null : cardBank.trim();
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType == null ? null : cardType.trim();
	}

	public Date getCardAddDate() {
		return cardAddDate;
	}

	public void setCardAddDate(Date cardAddDate) {
		this.cardAddDate = cardAddDate;
	}
}