class ModelLoanTypes {
  dynamic? id;
  dynamic? loanCategoryName;
  dynamic? loanMaximumAmount;
  dynamic? loanRepaymentPeriod;
  dynamic? loanInterest;
  dynamic? loanMinimumAmount;

  ModelLoanTypes.fromapi(Map snapshot) {
    this.id = snapshot['id'];
    this.loanCategoryName = snapshot['loanCategoryName'];
    this.loanMaximumAmount = snapshot['loanMaximumAmount'];
    this.loanRepaymentPeriod = snapshot['loanRepaymentPeriod'];
    this.loanInterest = snapshot['loanInterest'];
    this.loanMinimumAmount = snapshot['loanMinimumAmount'];
  }
  ModelLoanTypes();
}
