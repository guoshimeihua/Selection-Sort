#闲话选择排序算法
###导语
> 考虑排序存储在数组A中的n个数：首先找出A中的最小元素并将其与A[1]中的元素进行交换。接着，找出A中的次最小元素并将其与A[2]中的元素进行交换。对A中前n-1个元素按该方式继续。该算法称为选择排序算法，写出伪代码。该算法维持的循环不变式是什么？为什么它只需要对前n-1个元素，而不是对所有n个元素运行？用O记号给出选择排序的最好情况与最坏情况运行时间。

###伪代码实
	1 for j=1 to A.length-1
	2	min = A[j];
	3	i = j + 1;
	4	k = j;  //k记录找到最小值的位置
		
	5	while i<A.length 
	6		if A[i] < min
	7			min = A[i];
	8			k = i;
	9		i = i + 1;
	10	A[k] = A[j];
	11	A[j] = min;
补充：伪代码中规定数组下标从1开始的。

###该算法的循环不变式与选择排序的正确性
> 循环不变式主要用来帮助我们理解算法的正确性。关于循环不变式，我们必须证明三条性质：（1）初始化：循环的第一次迭代之前，它为真。(2) 保持：如果循环的某次迭代之前它为真，那么下次迭代之前它仍为真。（3）终止：在循环终止时，不变式为我们提供一个有用的性质，该性质有助于证明算法是正确的。

>这类似与数学的归纳法，其中为了证明某条性质成立，需要证明一个基本情况和一个归纳步。这里，证明第一次迭代之前不变式成对应于基本情况，证明从一次迭代到下一次迭代不变式成立对应于归纳步。第三条性质也许是最重要的，因为我们将使用循环不变式来证明其正确性。通常，我们和导致循环终止的条件一起使用循环不变式。终止性不同于我们通常使用的数学归纳法的做法，在归纳法中，归纳步是无限使用的，这里当循环终止时，停止归纳。

对于选择排序，我们来使用上面的三条性质来证明一下。

初始化：在循环第一次迭代之前，j=0, 所以子数组A[j]为空，这个空的子数组包含数组A中最小的元素值。

保持：在循环第二次迭代之前，A[1]是剩余数组中最小的，这样依次类推，在循环第三次迭代之前，A[2是剩余数组中最小的，第四次循环迭代之前，A[3]是剩余数组中最小的...

代码5~9行的作用就是找到了最小值(min)的位置，10~11行把最小值(min)与A[j]中的元素进行交换。这时子数组A[1..j]中的元素大小关系就是A[1]<..A[j]，且A[j]是剩余数组中最小的元素，这样我们就可以得到在下一次循环迭代之前将保持循环不变式。

终止：最后我们看下循环终止时发生了什么。导致for循环终止的条件是j>A.length-1=n-1。因为每次循环迭代j增加1，那么必有j=n。在循环不变式中将j用n-1代替，我们看到A[1..n-1]的大小关系是A[1]<..A[n-1]，且此时A[n-1]是剩余数组中最小的元素，由此可以得出整个数组的关系是A[1]<..A[n-1]<A[n]，到此时整个数组已经排序完毕，因此算法正确。

###选择排序算法的分析
> 一个算法在特定输入上的运行时间是指执行的基本操作数或步数。定义步的概念以便尽量独立于机器是方便的。目前，我们假定执行每行伪代码需要常量时间。虽然一行与另一行可能需要不同数量的时间，但是我们假定第i行的每次执行需要时间Ci，其中Ci是一个常量。

在选择排序过程中，假设tj表示对那个值j在第5行执行的while循环测试的次数(j是t的下坐标)。当一个for或while循环按通常的方式退出时，执行测试的次数比执行循环体的次数多1。每条语句的执行时间和执行次数如下图所示：

![selection-sort-01](https://github.com/guoshimeihua/Selection-Sort/blob/master/selection-sort-01.jpg)

由此可见SELECTION-SORT的运行时间T(n)等于：

![selection-sort-01](https://github.com/guoshimeihua/Selection-Sort/blob/master/selection-sort-02.jpg)

在给定规模的情况下，一个算法的运行时间也可能与给定规模下的哪个输入有关。比如，若输入数组已经排序好，则出现最佳情况，这时第7行、8行tj=1。在第5行，我们必须将每个元素与min比较，所以有tj=n。该最佳情况的运行时间为：

![selection-sort-01](https://github.com/guoshimeihua/Selection-Sort/blob/master/selection-sort-03.jpg)

因此它是n的二次函数，时间复杂度为O(n*n)。

若输入数组已经反向排序，则导致最坏情况。这个时候第5、6、7、8、9行tj=n。在最坏情况下的运行时间为：

![selection-sort-01](https://github.com/guoshimeihua/Selection-Sort/blob/master/selection-sort-04.jpg)

在最坏情况下，时间复杂度也为O(n*n)。到这里就可以看出，选择排序算法最好情况与最坏情况是一样的。

最后附上swift代码实现，运行环境：playground。下一篇将介绍下插入排序的变异算法。

	var array = NSMutableArray.init(array: ["31", "41", "59", "26", "41", "58"])
	for j in 0 ..< array.count-1 {
    	var min = array[j].integerValue
    	var i = j + 1
    	var k = j
    
    	while i < array.count {
        	if array[i].integerValue < min {
           	 min = array[i].integerValue
           	 k = i
        	}
       	 i = i + 1
    	}
    
    	array.replaceObjectAtIndex(k, withObject: array[j])
    	array.replaceObjectAtIndex(j, withObject: String.init(stringInterpolationSegment: min))
	}

	print(array)















