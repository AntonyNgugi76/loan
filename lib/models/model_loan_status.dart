

class ModelLoanStatus {
  dynamic? loanStatus;
  dynamic? loanMobile;
  dynamic? loanLimit;
  dynamic? loan_balance;
  dynamic? loanAmount;



  ModelLoanStatus.fromapi(Map snapshot) {
    // Map<String, dynamic> snapshot = data.data() as Map<String, dynamic>;
    this.loanStatus = snapshot['loanStatus'];
    this.loanMobile = snapshot['loanMobile'];
    this.loanLimit = snapshot['loanLimit'];
    this.loan_balance = snapshot['loanBalance'];
    this.loanAmount = snapshot['loanAmount'];

  }

  ModelLoanStatus();

}


