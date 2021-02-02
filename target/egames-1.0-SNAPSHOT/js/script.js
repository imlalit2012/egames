function add_to_cart(ProductId, Title, Price)
{

    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        // no cart yet
        let products = [];
        let product = {productId: ProductId, productName: Title, productQuantity: 1, productPrice: Price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time")

    } else
    {
        // cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == ProductId)
        if (oldProduct)
        {
            // increase quantity
            oldProduct.productQuantity = oldProduct.product + 1;
            pcart.map((item) => {

                if (item.productQuantity == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is inceased")
        } else
        {
            // add new product
            let product = {productId: ProductId, productName: Title, productQuantity: 1, productPrice: Price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added")
        }
    }
    updateCart();
}


// Update Cart

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Cart is Empty!!")
        $(".cart-items").html("( 0 )");
        $(".card-body").html("<h3>CArt does not have any items</h3>");
        $(".checkout-btn").addClass("disabled");
    } else
    {
        console.log(cart)
        $(".cart-items").html(`( ${cart.length} ) `);
        
        let table = `
        <table class= 'table'>
            <thead class='thread-light'>
              <tr>
              <th>Product Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Total Price</th>
              <th>Action</th>
        
            </tr>
        </thead>


        `;
        
        let totaPrice=0;
        cart.map((item) => {
            
            table +=` 
           <tr>
            <td> ${item.productName}</td>
            <td> ${item.productPrice}</td>
            <td> ${item.productQuantity}</td>
            <td> ${item.productQuantity * item.productPrice}</td>
            <td> <button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
            </tr>
            `
            totaPrice+=item.productPrice*item.productQuantity;
        })
        
        table=table + `
         <tr><td style="font-size:120%" colspan='5' class="text-right font-weight-bold m-5"> Total Pricce : ${totaPrice}</td></tr>
        </table>`
        $(".cart-body").html(table);
    }
}

// Remove Item
function deleteItemFromCart(ProductId)
{
    let cart=JSON.parse(localStorage.getItem('cart'));
    
    let newcart=cart.filter((item) => item.productId != ProductId)
    
    localStorage.setItem('cart', JSON.stringify(newcart))
    console.log("Product is Removed")

    updateCart();
}

$(document).ready(function () {
    updateCart()
})