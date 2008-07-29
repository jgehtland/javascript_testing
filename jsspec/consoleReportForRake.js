Object.extend(Specs.ConsoleReport.prototype, {
  afterAll: function() {
    if(this.errors > 0 || this.failed > 0) {
      throw "JSSpec tests failed...";
    };
  }
});