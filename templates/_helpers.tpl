{{/* Nombre base del chart */}}
{{- define "rctech-web.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Nombre completo del release (release-name + chart-name) */}}
{{- define "rctech-web.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Labels comunes aplicadas a todos los recursos */}}
{{- define "rctech-web.labels" -}}
app.kubernetes.io/name: {{ include "rctech-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/* Selector labels (usadas por Deployment y Service para enlazar pods) */}}
{{- define "rctech-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rctech-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
