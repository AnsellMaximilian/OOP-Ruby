def merge_sort(arr)
    if arr.length == 2
        if arr[0] > arr[1]
            temp = arr[0]
            arr[0] = arr[1]
            arr[1] = temp
        end
    elsif arr.length > 2
        arr1 = merge_sort(arr[0..(arr.length/2-1).ceil])
        arr2 = merge_sort(arr[(arr.length/2).ceil..arr.length-1])
        
        arr = []
        while arr1.length > 0 || arr2.length > 0 do
            if arr1.length > 0 && arr2.length > 0
                if arr1[0] > arr2[0]
                    arr << arr2.shift
                else
                    arr << arr1.shift
                end
            else
                if arr1.length == 0
                    arr += arr2
                    arr2 = []
                else
                    arr += arr1
                    arr1 = []
                end
            end
        end
    end
    arr
end

# p merge_sort([3,4,7,9,1,10,11,5,6,20,89,66, 72,14,15,100])
p merge_sort([3,4,7,9,1,10,11])