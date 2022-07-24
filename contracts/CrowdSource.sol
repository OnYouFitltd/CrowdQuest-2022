// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.5.1;

contract CrowdSource {
   
    event SubmitQuestion(
        string subject,
        string question,
        string[] options,
        string imgHash,
        uint256 ans,
        bool approve
    );

    struct Problem {
        string subject;
        string question;
        string[] options;
        string imgHash;
        uint256 ans;
        bool approve;
    }

    Problem[] problems;

    function addToBlockchain(
        string memory _subject,
        string memory _question,
        string[] memory _options,
        string memory _imgHash,
        uint256 _ans,
        bool _approve
    ) public {
        problems.push(Problem(_subject, _question, _options,_imgHash, _ans, _approve));

        emit SubmitQuestion(_subject, _question, _options,_imgHash, _ans, _approve);
    }

    function getAllQuestions() public view returns (Problem[] memory){
        Problem[] memory ret = new Problem[](problems.length);
        for (uint i = 0; i < problems.length; i++) {
            ret[i] = problems[i];
        }
        return ret;
    }
}
