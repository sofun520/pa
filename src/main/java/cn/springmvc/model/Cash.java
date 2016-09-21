package cn.springmvc.model;

import java.math.BigDecimal;
import java.util.Date;

public class Cash {
	private Integer cashId;

	private BigDecimal cashAmount;

	private Integer cashCardId;

	private Double cashFate;

	private Date cashDate;

	private Card card;

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public Integer getCashId() {
		return cashId;
	}

	public void setCashId(Integer cashId) {
		this.cashId = cashId;
	}

	public BigDecimal getCashAmount() {
		return cashAmount;
	}

	public void setCashAmount(BigDecimal cashAmount) {
		this.cashAmount = cashAmount;
	}

	public Integer getCashCardId() {
		return cashCardId;
	}

	public void setCashCardId(Integer cashCardId) {
		this.cashCardId = cashCardId;
	}

	public Double getCashFate() {
		return cashFate;
	}

	public void setCashFate(Double cashFate) {
		this.cashFate = cashFate;
	}

	public Date getCashDate() {
		return cashDate;
	}

	public void setCashDate(Date cashDate) {
		this.cashDate = cashDate;
	}
}