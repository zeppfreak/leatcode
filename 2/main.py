from typing import Optional

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        carry = 0
        dummy = ListNode(0)
        curr = dummy
    
        while l1 or l2 or carry:
            val1 = l1.val if l1 else 0
            val2 = l2.val if l2 else 0
            
            # 2つの数字とキャリーを加算する
            total = val1 + val2 + carry
            carry = total // 10  # 桁上がりを計算する
            curr.next = ListNode(total % 10)  # 1桁目を取得する
            
            # 次の桁を処理する
            curr = curr.next
            l1 = l1.next if l1 else None
            l2 = l2.next if l2 else None
        
        return dummy.next


s = Solution()
ln1 = ListNode(2, ListNode(4, ListNode(3)))
ln2 = ListNode(5,ListNode(6,ListNode(4)))
ln = s.addTwoNumbers(ln1, ln2)

val = ln.val
next = ln.next
carry = 0
while val or next:
    print(val)
    val = next.val if next else None
    next = next.next if next else None