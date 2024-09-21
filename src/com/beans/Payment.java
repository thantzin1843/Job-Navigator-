package com.beans;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Payment {
    private int paymentId;
    private int companyId;
    private long transactionId;
    private String paymentMethod;
    private String paymentScreenshot;
    private String paymentStatus;
    private Timestamp paymentDate;
    private MultipartFile resumeFile;
    private String hiddenPayment;
   

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(long transactionId) {
        this.transactionId = transactionId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentScreenshot() {
        return paymentScreenshot;
    }

    public void setPaymentScreenshot(String paymentScreenshot) {
        this.paymentScreenshot = paymentScreenshot;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public String getHiddenPayment() {
        return hiddenPayment;
    }

    public void setHiddenPayment(String hiddenPayment) {
        this.hiddenPayment = hiddenPayment;
    }
    
   

    public MultipartFile getResumeFile() {
        return resumeFile;
    }

    public void setResumeFile(MultipartFile resumeFile) {
        this.resumeFile = resumeFile;
    }
    
  
}
