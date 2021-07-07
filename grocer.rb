require "pry"
def find_item_by_name_in_collection(name, collection)

#return the intire hash if equal to the argument name given
index  = 0
while index < collection.length do
  if collection[index][:item] === name
   return collection[index]
 else
   nil
  end
  index += 1
end


end

def consolidate_cart(cart)

new_array = []
index = 0

while index < cart.length do


cart_item = find_item_by_name_in_collection(cart[index][:item], new_array)

if cart_item != nil
  cart_item[:count] += 1
else
  cart_item = {
    :item => cart[index][:item],
    :price => cart[index][:price],
    :clearance => cart[index][:clearance],
    :count => 1
  }
  new_array << cart_item
end

index += 1

end
new_array

end


def apply_coupons(cart, coupons)

index = 0
while index < coupons.length do

cart_item = find_item_by_name_in_collection(coupons[index][:item], cart)
coupons_item_name = "#{coupons[index][:item]} W/COUPON"
cart_item_with_coupon = find_item_by_name_in_collection(coupons_item_name, cart)
if coupons_item_name && cart_item[:count] >= coupons[index][:num]
  if cart_item_with_coupon
    cart_item_with_coupon[:count] += coupons[index][:num]
  else
    cart_item_with_coupon = {
      item: coupons_item_name,
      price: coupons[index][:cost] / coupons[index][:num],
      count: coupons[index][:num],
      clearance: cart_item[:clearance]

    }
    cart << cart_item_with_coupon
    cart_item[:count] -= coupons[index][:num]

  end
end
  index += 1
end
cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  index  = 0
  while index < cart.length do

    if cart[index][:clearance]
      cart[index][:price] =  (cart[index][:price] - (cart[index][:price] * 0.2))
  end
  index += 1

  end
  cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)

new_cart = consolidate_cart(cart)
apply_coup =  apply_coupons(new_cart, coupons)
final_cart = apply_clearance(apply_coup)

total = 0
index = 0
while index < final_cart.length do

total += final_cart[index][:price] * final_cart[index][:count]
index += 1
end
if total > 100
 total -= (total * 0.10)

end
return total

end
