// cart.js

let cart = JSON.parse(localStorage.getItem('cart')) || [];

function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

function updateCartDisplay() {
    const cartTableBody = document.getElementById('cart-table-body');
    const totalPriceElement = document.getElementById('total-price');
    cartTableBody.innerHTML = '';
    let totalPrice = 0;

    cart.forEach((item, index) => {
        const row = document.createElement('tr');
        const subtotal = item.quantity * item.price;
        totalPrice += subtotal;

        row.innerHTML = `
            <td>${item.name}</td>
            <td>
                <input type="number" value="${item.quantity}" class="form-control quantity-input" data-index="${index}">
            </td>
            <td>$${item.price.toFixed(2)}</td>
            <td>$${subtotal.toFixed(2)}</td>
            <td>
                <button class="btn btn-danger btn-sm remove-item" data-index="${index}">Eliminar</button>
            </td>
        `;

        cartTableBody.appendChild(row);
    });

    totalPriceElement.textContent = totalPrice.toFixed(2);
}

function addToCart(product) {
    const existingProduct = cart.find(item => item.id === product.id);

    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        cart.push(product);
    }

    saveCart();
    updateCartDisplay();
}

document.addEventListener('DOMContentLoaded', () => {
    updateCartDisplay();

    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', event => {
            const product = {
                id: event.target.getAttribute('data-id'),
                name: event.target.getAttribute('data-name'),
                price: parseFloat(event.target.getAttribute('data-price')),
                quantity: 1
            };

            addToCart(product);
        });
    });

    document.getElementById('cart-table-body').addEventListener('change', event => {
        if (event.target.classList.contains('quantity-input')) {
            const index = event.target.getAttribute('data-index');
            cart[index].quantity = parseInt(event.target.value, 10);
            saveCart();
            updateCartDisplay();
        }
    });

    document.getElementById('cart-table-body').addEventListener('click', event => {
        if (event.target.classList.contains('remove-item')) {
            const index = event.target.getAttribute('data-index');
            cart.splice(index, 1);
            saveCart();
            updateCartDisplay();
        }
    });
});