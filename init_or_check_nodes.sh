#!/bin/bash
set -e

echo "🌀 RunPod 재시작 시 의존성 복구 시작"

cd /workspace/ComfyUI/custom_nodes || {
  echo "⚠️ custom_nodes 디렉토리 없음. ComfyUI 설치 전일 수 있음"
  exit 0
}

for d in */; do
  req_file="${d}requirements.txt"
  marker_file="${d}.installed"

  if [ -f "$req_file" ]; then
    if [ -f "$marker_file" ]; then
      echo "⏩ $d 이미 설치됨, 건너뜀"
      continue
    fi

    echo "📦 $d 의존성 설치 중..."
    if pip install -r "$req_file"; then
      touch "$marker_file"
    else
      echo "⚠️ $d 의존성 설치 실패 (무시하고 진행)"
    fi
  fi
done

echo "✅ 모든 커스텀 노드 의존성 복구 완료"
echo "🚀 Start Engine!"
echo -e "\n====🎓 AI 교육 & 커뮤니티 안내====\n"
echo -e "🧠 Youtube : https://www.youtube.com/@A01demort"
echo -e "✅ 교육 문의 : https://a01demort.com"
echo -e "✅ Udemy 강의 : https://bit.ly/comfyclass"
echo -e "✅ Stable AI KOREA : https://cafe.naver.com/sdfkorea"
echo -e "✅ 오픈채팅방 : https://open.kakao.com/o/gxvpv2Mf"
echo -e "✅ CIVITAI : https://civitai.com/user/a01demort"
echo -e "\n==================================="
