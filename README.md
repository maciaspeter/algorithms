# algorithms

There are two sorting algorithms -

merge sort - a proven sorting algorithm - divide and conquer.

growth sort - It is a divide and conquer algorithm as well. I created this algorithm (I don't know if there is similar or same algorithm in past) and borrowed ideas from merge sort.

The steps are

1. find the middle index. create left, and right indexes and assign the middle index in those indexes
2. look at the value in middle, compares the index to left and right
3. if the value of the left of the middle index is lower than the value in middle index, decrement the left - vice versa for right index (increment index). This block is already sorted if we knew the values are lower/higher than this value in middle index.
4. the remaining indexes will be recursively.

5. 3 blocks of arrays will be merged.

there are inefficiencies in this sorting algorithm and is for learning experience.

I am not sure what is the probabilities of the lower value/higher value next to the middle index.

This algorithm is still slower than merge sort.
