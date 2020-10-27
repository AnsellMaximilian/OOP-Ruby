def bubble_sort(array)
    temp = 0
    for j in 0..(array.length - 2)
        for i in 0..(array.length - 1)

            if i < (array.length - 1)
                if array[i] > array[i+1]
                    temp = array[i]
                    array[i] = array[i+1]
                    array[i+1] = temp
                end
            end
            
        end
    end
    return array
end

p bubble_sort([4,3,78,2,0,2])