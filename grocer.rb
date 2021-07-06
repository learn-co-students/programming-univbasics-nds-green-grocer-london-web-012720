def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  outer_index =0
collector ={}
  hash_collection ={}

  while outer_index < collection.length do

      if name == collection[outer_index][:item]

            print collection[outer_index]
            return  collection[outer_index]
        end
outer_index += 1
          end

end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
new_cart =[]
counter =0
while counter < cart.length
  new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
  if new_cart_item != nil
    new_cart_item[:count] += 1
  else
    new_cart_item =
    {
      :item => cart[counter][:item],
      :price => cart[counter][:price],
      :clearance => cart[counter][:clearance],
      :count => 1
    }
 new_cart << new_cart_item
end
counter +=1
end
new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
consolidate_cart(cart)
index = 0
while index < coupons.length
cart_item = find_item_by_name_in_collection(coupons[index][:item],cart)
couponed_item_name = "#{coupons[index][:item]} W/COUPON"
cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
if cart_item  && cart_item[:count] >= coupons[index][:num]
  if cart_item_with_coupon
    cart_item_with_coupon[:count] += coupons[index][:num]
    cart_item[:count] -= coupons[index][:num]
  else
    cart_item_with_coupon =
    {
      :item => couponed_item_name,
      :price => coupons[index][:cost] / coupons[index][:num],
      :count => coupons[index][:num],
      :clearance => cart_item[:clearance]

    }
cart << cart_item_with_coupon
cart_item[:count] -= coupons[index][:num]
  end
end

  index +=1
end

cart

end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
counter = 0
while counter < cart.length
  if cart[counter][:clearance]
cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price]*0.20)).round(2)


end
    counter +=1

end

cart

end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
consolidated_cart = consolidate_cart(cart)
couponed_cart = apply_coupons(consolidated_cart, coupons)
clearanced_cart = apply_clearance(couponed_cart)

total = 0
counter =0

while counter < clearanced_cart.length  do
total += clearanced_cart[counter][:price] * clearanced_cart[counter][:count]
  counter +=1
end

if total > 100
total -= (total * 0.10)

end
    total
end
