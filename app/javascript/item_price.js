window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price")
  console.log(priceInput)
  priceInput.addEventListener("input", function(){
    const price = document.getElementById("item-price").value
    console.log(price)

      const tax = price * 0.1
    console.log(tax)

      const profit = price - tax
    console.log(profit)

      const taxForm = document.getElementById("add-tax-price")
      console.log(taxForm)

      taxForm.textContent = Math.floor(tax)
      const profitForm = document.getElementById("profit")
      console.log(profitForm)
      
      profitForm.textContent = Math.floor(profit)
  })
});
//textContentは Node のプロパティで、ノードおよびその子孫のテキストの内容を表します。
//textContent は、 <script> と <style> 要素を含む、すべての要素の内容を取得します。
//似たものでinnerTextがあるが、再フローを起動してしまうため、計算が重くなる。可能であれば避けるべき。
