// SPDX-License-Identifier: MIT
// 声明开源许可证类型为MIT，允许代码在特定条件下被自由使用

pragma solidity ^0.8.0;
// 指定Solidity编译器版本必须大于等于0.8.0且小于0.9.0

/// @notice 定义当地址解锁池管理器时的回调接口
interface IUnlockCallback {
    /// @notice 当管理器被解锁时，由池管理器在调用者地址上触发
    /// @param data 解锁调用时传入的原始数据
    /// @return 希望从解锁调用返回的任意数据
    function unlockCallback(bytes calldata data) external returns (bytes memory);
    // 外部回调函数定义：
    // - 使用calldata传递只读数据节省gas
    // - 必须由实现此接口的合约重写具体逻辑
    // - 返回值允许传递处理结果
}