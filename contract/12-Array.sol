// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array {
    // 动态数组，也有的动态数组会在编译时确定长度
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // 固定长度数组，所有元素被初始化为 0
    uint256[10] public fixedArr;

    function get(uint256 i) public view returns (uint256) {
        require(i < arr.length, "Out of index");
        return arr[i];
    }

    // 这个方法可以返回整个数组，但是要避免返回那些可以无限长的数组
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        // pop 方法弹出最后一个元素，且数组长度会改变
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // 这里需要注意，删除元素只是将该索引位置的值赋值为 0，但数组长度不变
        delete arr[index];
    }

    function examples() external pure {
        // 创建基于内存的数组，只有固定长度的才能被创建
        uint256[] memory a = new uint256[](5);
        a[0] = 1;
    }
}

contract ArrayRemoveByShifting {
    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);

        // assert 里面运行结果为 true 则合约运行不会报错，否则将会抛出异常
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
    }
}
