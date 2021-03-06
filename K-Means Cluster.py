from numpy import *
# 加载数据
def loadDataSet(clusterdata):  # 将2015年地级市数据存在txt中，以换行符分割不同城市
    dataMat = []               # 文件的最后一个字段是类别标签
    fr = open(clusterdata)
    for line in fr.readlines():
        curLine = line.strip().split('\t')
        fltLine = map(float, curLine)    # 将每个数据全转成float类型
        dataMat.append(fltLine)
    return dataMat

# 计算欧氏距离
def distEclud(vecA, vecB):
    return sqrt(sum(power(vecA - vecB, 2))) # 求两个向量之间的距离

# 随机取聚类中心
def randCent(clusterdata, k):
    n = shape(clusterdata)[1]
    centroids = mat(zeros((k, n)))   # 每个个体有n个维度，总共要k个聚类中心
    for j in range(n):
        minJ = min(clusterdata[:, j])
        maxJ = max(clusterdata[:, j])
        rangeJ = float(maxJ - minJ)
        centroids[:, j] = minJ + rangeJ * random.rand(k, 1)
    return centroids

# k-means 聚类算法
def kMeans(dataSet, k, distMeans =distEclud, createCent = randCent):
    m = shape(dataSet)[0]
    clusterAssment = mat(zeros((m,2)))    # 用于存放该样本属于哪类及到中心距离
    # clusterAssment第一列存放该数据所属的中心点，第二列是该数据到中心点的距离
    centroids = createCent(dataSet, k)
    clusterChanged = True   # 用来判断聚类是否已经收敛
    while clusterChanged:
        clusterChanged = False;
        for i in range(m):  # 把每一个数据点划分到离它最近的中心点
            minDist = inf; minIndex = -1;
            for j in range(k):
                distJI = distMeans(centroids[j, :], dataSet[i, :])
                if distJI < minDist:
                    minDist = distJI; minIndex = j  # 如果第i个数据点到第j个中心点更近，则将i归属为j
            if clusterAssment[i, 0] != minIndex:clusterChanged = True;  # 如果分配发生变化，则需要继续迭代
            clusterAssment[i, :] = minIndex,minDist**2   # 并将第i个数据点的分配情况存入字典
        print(centroids)
        for cent in range(k):   # 重新计算中心点
            ptsInClust = dataSet[nonzero(clusterAssment[:,0].A == cent)[0]]   # 去第一列等于cent的所有列
            centroids[cent,:] = mean(ptsInClust, axis = 0)  # 算出这些数据的中心点
    return centroids, clusterAssment

datMat = mat(loadDataSet('地级市分类.txt'))
myCentroids,clustAssing = kMeans(datMat, 3)
print(myCentroids)
print(clustAssing)
