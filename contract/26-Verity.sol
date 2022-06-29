// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Verity {
    // 签名的步骤
    // 1. 创建要签名的 message
    // 2. 对 message 进行 Hash => hash
    // 3. 对 Hash 进行 Sign => signature

    // 校验的步骤
    // 1. 从 transction 中获取 message
    // 2. 从 signature 中恢复 signer 和 hash
    // 3. 比较第二步中恢复的 signer 和 发送交易的 signer

    function getHashFromMessage(
        address _to,
        uint256 _amount,
        string memory _message,
        uint256 _nonce
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        // 签名的格式为
        // "\x19Ethereum Signed Message\n" + len(msg) + msg
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    function verity(
        address _signer,
        address _to,
        uint256 _amount,
        string memory _message,
        uint256 _nonce,
        bytes memory signature
    ) public pure returns (bool) {
        bytes32 messageHash = getHashFromMessage(
            _to,
            _amount,
            _message,
            _nonce
        );
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

    function recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignatrue(_signature);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignatrue(bytes memory sig)
        public
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(sig.length == 65, "invalid signature length");

        assembly {
            // 这里用到了 assemble
            // 前 32 字节存储了签名的长度，因此我们直接跳过
            // add(sig, 32) 相当于移动指针到索引为 32 的位置
            // mload(p) 从 p 中加载 32 字节的数据

            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))

            // 这里会隐式直接返回 r s v
        }
    }
}
